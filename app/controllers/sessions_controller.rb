class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @redlights = Redlight.all
    if session[:user_id]
    @user = User.find(session[:user_id])
    @greenlight = @user.greenlight?
  end
  end 

  def create
    @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password]) 
        session[:user_id] = @user.id
        redirect_to '/dashboard'
      else
        flash[:notice] = "Invalid email/password combination, please try again"
        render 'new'
      end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to '/'
  end

end