module MustacheTemplateHandler
  def self.call(template)
    #assigns contains all the instance_variables defined on the controller's view method
    "Mustache.render(#{template.source.inspect}, assigns).html_safe"
  end
end

# Register a mustache handler in the Rails template engine
ActionView::Template.register_template_handler(:mustache, MustacheTemplateHandler)
 
