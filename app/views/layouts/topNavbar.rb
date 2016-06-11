# Extend Mustache class to create a Mustache View
class TopNavbar < Mustache

  # Define a default value for labels in case it"s not defined on current view context
  def labels
      @labels || {  
      "home"=>I18n.t("app.Home"),
      "login"=>I18n.t("app.Login"),
      "signup"=>I18n.t("app.Signup"),
      "forgotPassword"=>I18n.t("app.Forgot my password"),
      "logout"=>I18n.t("app.Logout"),
      "settings"=>I18n.t("app.Settings"),
      "password"=>I18n.t("app.Password Change"),
      "action"=>I18n.t("app.Action"),
      "brand"=>"Sample eshop ror",
      "language"=>I18n.t("app.language")
      }
  end

  def langs
      @langs || {  
      "current"=>I18n.t("app.#{I18n.locale}"),
      "en"=>I18n.t("app.en"),
      "ru"=>I18n.t("app.ru"),
      }
  end

  self.template_file = "app/templates/layouts/topNavbar.mustache" 
  
  def simple_render
    self.template_file = 'app/templates/layouts/topNavbarSimple.mustache'
    render 
  end

  def lang_render
    self.template_file = 'app/templates/layouts/topNavbarLang.mustache'
    render 
  end

end
