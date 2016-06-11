# Extend Mustache class to create a Mustache View

require "./app/helpers/contact_helper"
require "./app/views/common/int_mustache"

class ContactForm < IntMustache

  def labels
      @labels || ContactHelper::labels()
  end

  def pageTitle
    @pageTitle || labels()["title"]
  end

  #def template_file 
  #  "site/pages/contact" 
  #end
  
  self.template_name = "site/pages/contact"


end
