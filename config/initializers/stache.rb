Stache.configure do |config|
  config.template_base_path = Rails.root.join('app', 'templates')
  config.use :mustache
  #config.use :handlebars
end
