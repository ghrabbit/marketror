require "./app/helpers/login_helper"
require "./app/views/common/int_mustache"
# Extend Mustache class to create a Mustache View
class Login < IntMustache

  def labels
      @labels || LoginHelper::labels()
  end

  def pageTitle
    @pageTitle || labels()["title"]
  end

  self.template_name = "account/login" 

  

end
