class Message < Hanami::Entity

  def encrypt
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

end
