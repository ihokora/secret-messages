class Message < Hanami::Entity

  def encrypt!
    cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    cipher.encrypt
    attributes[:key] = cipher.random_key
    attributes[:text] = cipher.update(attributes[:text]) + cipher.final
  end

  def decrypt
    decipher = OpenSSL::Cipher::AES.new(128, :CBC)
    decipher.decrypt
    decipher.key = self.key
    plain = decipher.update(self.text) + decipher.final
  end


  # id hashing methods for generating private links
  def encrypt_id
    @@id_key = Digest::SHA256.digest('SecretPassword')
    cipher = OpenSSL::Cipher::AES.new(256, :CBC)
    cipher.encrypt
    cipher.key = @@id_key
    encrypted_id = (cipher.update(self.id.to_s) + cipher.final).unpack('H*')[0]
  end

  def decrypt_id(encrypted_id)
    decipher = OpenSSL::Cipher::AES.new(256, :CBC)
    decipher.decrypt
    decipher.key = @@id_key
    decrypted_id = decipher.update([encrypted_id].pack('H*')) + decipher.final
  end

end
