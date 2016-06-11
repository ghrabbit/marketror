module ContactHelper
  def self.labels
      {  
      "verifyCode"=>I18n.t("app.Verification Code"),
      "name"=>I18n.t("app.Family Name"),
      "email"=>I18n.t("app.Email"),
      "subject"=>I18n.t("app.Subject"),
      "body"=>I18n.t("app.Body"),
      "title"=>I18n.t("app.Contact"),
      "toRefreshCaptcha"=>I18n.t("app.toRefreshCaptcha"),
      "captchaHelp"=>I18n.t("app.captchaHelp"),
      "submit"=>I18n.t("app.Submit"),
      "requiredFields"=>I18n.t("app.requiredFields"),
      "filloutForm"=>I18n.t("app.filloutContactForm")
      }
  end
end
