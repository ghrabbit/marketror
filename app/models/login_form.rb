require "./app/helpers/contact_helper"
require "./app/views/account/login"

class LoginForm
  include ActiveModel::Model
  #include ActiveModel::Serialization
 
  attr_accessor :username, :password, :rememberMe
  validates :username, :password, presence: true
  
  def labels
    @labels || LoginHelper::labels()
  end
 
  def form(options = {})
    _view = Login.new
    _view[:labels] = labels
    _view[:username] = @username
    _view[:password] = @password 
    _view[:rememberMe] = @rememberMe 
    options.each { |key,value| _view[key] = value }
    return _view 
  end
end
