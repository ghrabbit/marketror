# Extend Mustache class to create a Mustache View
class ErrorSummary < Mustache
  
  def errors
    @model.errors.messages
  end

  def self.template_file 
    "app/templates/documents/errorSummary.mustache" 
  end


end
