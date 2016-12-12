class Message < Hanami::Entity
  HOUR = 60 * 60

  def encrypt!
    cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    cipher.encrypt
    encoded_key = cipher.random_key
    attributes[:key] = Base64.encode64(encoded_key).encode('utf-8')
    encrypted = cipher.update(attributes[:text]) + cipher.final
    attributes[:text] = Base64.encode64(encrypted).encode('utf-8')
  end

  def decrypt
    decipher = OpenSSL::Cipher::AES.new(128, :CBC)
    decipher.decrypt
    decoded_key = Base64.decode64(self.key).encode('ascii-8bit')
    decipher.key = decoded_key
    decoded = Base64.decode64(self.text).encode('ascii-8bit')
    plain = decipher.update(decoded) + decipher.final
  end

  def set_expiration_time
    time_remains = self.time_remains * HOUR
    attributes[:expiration_time] = Time.now + time_remains
  end


  # id hashing methods for generating private links
  @@id_key = Digest::SHA256.digest('SecretPassword')

  def encrypt_id
    cipher = OpenSSL::Cipher::AES.new(256, :CBC)
    cipher.encrypt
    cipher.key = @@id_key
    encrypted_id = (cipher.update(self.id.to_s) + cipher.final).unpack('H*')[0]
  end

  def self.decrypt_id(encrypted_id)
    decipher = OpenSSL::Cipher::AES.new(256, :CBC)
    decipher.decrypt
    decipher.key = @@id_key
    decrypted_id = decipher.update([encrypted_id].pack('H*')) + decipher.final
  end

  def private_id
    self.encrypt_id
  end

  def subtract_visit
    visits_remains = self.visits_remains - 1
    MessageRepository.new.update(self.id, visits_remains: visits_remains)
  end

  def expired?
    if self.visits_remains
      return self.visits_remains < 0
    elsif self.expiration_time
      return self.expiration_time < Time.now
    end
  end

end
