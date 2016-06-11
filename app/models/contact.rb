require "./app/helpers/contact_helper"
require "./app/helpers/real_person_validator"
class Contact
  include ActiveModel::Model
  #include ActiveModel::Serialization
 
  attr_accessor :name, :email, :subject, :body, :verifyCode, :verifyCodeHash
  validates :name, :email, :subject, :body, :verifyCode, presence: true
  validates_with RealPersonValidator
  
  def labels
    @labels || ContactHelper::labels()
  end
 
  #def deliver
  #  if valid?
  #    # deliver email
  #  end
  #end

  #def attributes
  #  {'name' => nil}
  #end
end
