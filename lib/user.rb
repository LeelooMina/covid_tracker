class User
attr_accessor :id, :username, :password

@@users = []

    def initialize(username, password)
        @username = username
        @password = password
        @id = User.all.count + 1
        @@users << self
    end

    # reutnbr all users from users array
    def self.all
        @@users
    end


    # populate the users array
    def self.seed 
        users = [{username: "john123", password: "password"}, {username: "amy123", password: "password"}

i = 0

while i < users.count

    i += 1
    end


end
