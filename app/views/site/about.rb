# Extend Mustache class to create a Mustache View

require "./app/views/common/int_mustache"
class About < IntMustache

  #def template_file 
  #  "site/pages/about" 
  #end
  
  #def self.template_file 
  #  "#{template_path}/site/pages/about.#{template_extension}" 
  #end
  
  self.template_name = "site/pages/about"
 
end
