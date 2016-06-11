module LoginHelper
  def self.labels
      {  
      "username"=>I18n.t("app.username"),
      "password"=>I18n.t("app.password"),
      "rememberMe"=>I18n.t("app.rememberMe"),
      "submit"=>I18n.t("app.Submit"),
      "requiredFields"=>I18n.t("app.requiredFields"),
      }
  end
end
