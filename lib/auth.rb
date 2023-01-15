require 'bcrypt'

module Auth
    def self.create_hash_digest(password)
        Bcrypt::Password.create(password)
    end

    
end



