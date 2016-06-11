# Extend Mustache class to create a Mustache View
class InvalidModel < Mustache
  def initialize(model)  
    @model = model
  end

  def errors
    ar = []
    @model.errors.messages.each_pair do |symbol, value|   # For each attribute/default pair
      ar << {:attribute => symbol, :attribute_label => @model.labels["#{symbol}"], :value => value} 
    end
    return ar
  end

  def self.template_file 
    "app/templates/documents/invalidModel.mustache" 
  end


end
