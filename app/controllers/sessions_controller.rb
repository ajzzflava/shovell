class SessionsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by_login_and_password( params[:login], params[:password])
    if @current_user
      session[:user_id] = @current_user.id
      if session[:return_to]
        redirect_to session[:return_to]
        session[:return_to] = nil
      else
        redirect_to stories_path
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
  end
end
