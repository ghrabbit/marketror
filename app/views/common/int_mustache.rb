# Extend Mustache class to create a Mustache View

require "active_support"
class IntMustache < Mustache

  self.template_path = "app/templates/"
  
  #def render(data = template, ctx = {})
  #  self.template_path
  #  super data, ctx
  #end
  
  def render_int(context = {})
    #if File.exists?("#{template_path}/lang/#{I18n.locale}/#{template_file}.#{template_extension}")
    #  render(partial("lang/#{I18n.locale}/#{template_file}"), context)
    #else
    #  render(partial(template_file), context)
    #end 
    render(partial(template_name), context) 
  end
  
  def partial(name)
    #path = "#{template_path}/#{name}.#{template_extension}"
    path = "#{template_path}/lang/#{I18n.locale}/#{name}.#{template_extension}"
    if !File.exists?(path)
      path = "#{template_path}/#{name}.#{template_extension}"
    end  
    begin
      File.read(path)
    rescue
      raise if raise_on_context_miss?
      ""
    end
  end
  
  #def render_file(template, context = {})
  #  if File.exists?("#{template_path}/lang/#{I18n.locale}/#{template}.#{template_extension}")
  #    render(partial("lang/#{I18n.locale}/#{template}"), context)
  #  else
  #    render(partial(template), context)
  #  end  
  #end
end
