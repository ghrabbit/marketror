# Extend Mustache class to create a Mustache View
class Alert < Mustache
  def comment 
    'What is the matter?'
  end 
  
  def prompt
   'Alert' 
  end
  
def self.template_file 
    "app/templates/site/pages/alert.mustache" 
  end


end
