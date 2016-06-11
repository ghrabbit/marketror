require './app/views/layouts/topNavbar'
require './app/views/layouts/userMenu'
require './app/views/layouts/cartMenu'
require './app/views/site/notice'
require './app/views/site/alert'
class ApplicationController < ActionController::Base
  ## Prevent CSRF attacks by raising an exception.
  ## For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #before_action :require_layout
  
  #layout false
  layout "main"
  #I18n.locale = session[:current_locale] || I18n.default_locale 
  
  # Define the variables to be used on the view
  def require_layout
    I18n.locale = session[:current_locale] || I18n.default_locale
    logger.info "************** require_layout : I18n.locale #{I18n.locale}"
    #@message = I18n.t "app.Subcategories"
    @appName = 'Sample Eshop Ror'
    @pageTitle = I18n.t "app.Home"
        
    #@topNavbar = render_to_string(:template => 'layouts/topNavbar', :layout => false)
    view = TopNavbar.new
    @user = current_user
    view[:username] = @user.nil? ? I18n.t("app.guest") : @user.username
    view[:authenticated] = !@user.nil?
    @topNavbar = view.render
    @topNavbarSimple = view.simple_render
    @topNavbarLang = view.lang_render
    
    view = UserMenu.new
    @userMenu = view.render
    @userMenuSimple = view.simple_render
    view = CartMenu.new
    @cartMenu = view.render
    @cartMenuSimple = view.simple_render
    @rights = sprintf(I18n.t("app.rights") , '2013')
    @options = {head_tags: render_to_string(:template => 'application/head_tags', :layout => false)}
    
    if !notice.nil?
      view = Notice.new
      view[:pageTitle] = @pageTitle
      view[:message] = notice
      @formatMessage = view.render
    end
    
    if !alert.nil?
      view = Alert.new
      view[:pageTitle] = @pageTitle
      view[:message] = alert
      @formatMessage = view.render
    end

  end

  def render_content(content)
    require_layout
    render :text => content.render_int, :layout => "main" 
  end

  def render_text(text)
    require_layout
    render :text => text, :layout => "main" 
  end
  
  def index
    require_layout
  end

private
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
  
  def create(username, password)
    if user = User.authenticate(username, password)
      # Сохраняем ID пользователя в сессии, так что он может быть использован
      # в последующих запросах
      session[:current_user_id] = user.id
      return user
    end
    nil
  end
  
  def destroy
    # Убираем id пользователя из сессии
    @_current_user = session[:current_user_id] = nil
  end
end
