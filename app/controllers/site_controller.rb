require './app/views/site/about'
require "./app/views/site/contact_form"
require "./app/models/contact"
require "./app/views/documents/error_summary"
require "./app/views/documents/invalid_model"
class SiteController < ApplicationController
  
  def index
    @date = Time.now.to_date
    require_layout
  end
  
  def contact
    contact = Contact.new params[:contactForm]
    if contact.valid?
       UserMailer.contact_email(contact).deliver_now
         redirect_to '/site/index', notice: I18n.t('app.contactCreated') 
    else
      cf = ContactForm.new 
      cf[:model] = contact
      if !params[:contactForm].nil? #!@contact.errors.messages.empty?
        view = InvalidModel.new(contact)
        cf[:errorSummary] = view.render :labels => cf.labels #:errors => @contact.errors.messages 
      end
      render_content cf
    end
  end

  def about
    render_content About.new
  end

  def lang
    I18n.locale = params[:id]
    session[:current_locale] = I18n.locale
    logger.info "************** request.env[\"HTTP_REFERER\"] #{request.env["HTTP_REFERER"]}"
    #redirect_to :back
    redirect_to request.env["HTTP_REFERER"]
  end
end
