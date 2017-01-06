class UsersController < ApplicationController
	def new
    @user = User.new
  end

  def index
  	@users = User.all
  	@redlights = Redlight.all
    @redlight = Redlight.new 
    @user_redlight = Redlight.find_by(user_id: session[:user_id])
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end