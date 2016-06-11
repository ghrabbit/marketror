# Extend Mustache class to create a Mustache View
class UserMenu < Mustache

  # Define a default value for labels in case it"s not defined on current view context
  def labels
      @labels || {  
      "actions"=>I18n.t("app.Customer actions"),
      "catalog"=>I18n.t("app.Catalog"),
      "logout"=>I18n.t("app.Logout"),
      "settings"=>I18n.t("app.Settings"),
      "password"=>I18n.t("app.Password"),
      "login"=>I18n.t("app.Login"),
      "signup"=>I18n.t("app.Signup"),
      "about"=>I18n.t("app.About"),
      "contact"=>I18n.t("app.Contact"),
      }
  end

  self.template_file = "app/templates/layouts/userMenu.mustache" 

  def simple_render
    self.template_file = 'app/templates/layouts/userMenuSimple.mustache'
    render 
  end


end
