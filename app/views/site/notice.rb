# Extend Mustache class to create a Mustache View
class Notice < Mustache
  
  def comment 
    'What is the matter?'
  end 
  
  def prompt
   'Notice' 
  end

  def self.template_file 
    "app/templates/site/pages/notice.mustache" 
  end


end
