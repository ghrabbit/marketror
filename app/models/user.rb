require "./app/helpers/utils"

class User < ActiveRecord::Base
  self.table_name = "users"
  self.primary_key = "id"
  validates :username, presence: true, length: { maximum: 32 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  
  class << self
    def authenticate(username, password) 
      user = self.find_by({:username => username})
      if !user.nil?
        return user if user.validatePassword?(password)
      end
      nil
    end
  end

  def validatePassword?(password) 
    return false if password.nil?
    password.crypt(self.salt) == self.password
  end

  def getRoles()
    return @_roles.lines($,)
  end
  	
end
