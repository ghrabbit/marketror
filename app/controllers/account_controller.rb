require 'login_form'
require 'user'
require "./app/views/account/login"
require "./app/views/documents/invalid_model"
require "./app/models/user"
class AccountController < ApplicationController
  
  def login
    if !params[:rememberMe].nil? 
      params[:rememberMe] = 1
    end
    model = LoginForm.new(params[:loginForm])
    
    options = {}
    if model.valid? && authenticate?(model)
      redirect_to '/' #:back
    else 
      if !params[:loginForm].nil?
        view = InvalidModel.new(model)
        options[:errorSummary] = view.render :labels => model.labels
      end
      render_content model.form(options)
    end
  end

  def authenticate?(model)
    if user = create(model.username, model.password)
      return true
    end
    model.errors.messages[:password] = "Invalid username or password"
    false
  end
  
  def logout
    destroy
    redirect_to '/'
  end
  
  
end
