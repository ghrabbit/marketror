# Extend Mustache class to create a Mustache View
class CartMenu < Mustache

  # Define a default value for labels in case it"s not defined on current view context
  def labels
      @labels || {  
      "shopping"=>I18n.t("app.Shopping"),
      "shopping-"=>I18n.t("app.Shopping"),
      "shopping-cart"=>I18n.t("app.Shopping Cart"),
      "qty"=>I18n.t("app.Qty"),
      "total"=>I18n.t("app.Total"),
      "purchase-now"=>I18n.t("app.Purchase Now"),
      }
  end

  self.template_file = "app/templates/layouts/cartMenu.mustache" 

  def simple_render
    self.template_file = 'app/templates/layouts/cartMenuSimple.mustache'
    render 
  end

end
