class RedlightsController < ApplicationController
	def new 
		@redlight = Redlight.new
	end 

  def create
    @user = User.find(session[:user_id])
    @redlight = Redlight.new(redlight_params)
    @redlight.user_id = @user.id
    if @redlight.save
      redirect_to '/dashboard'
    else
      @errors = @redlight.errors.full_messages
      flash[:notice] = @errors
      redirect_to '/dashboard'
    end
  end

  def edit
    @user_redlight = Redlight.find_by(user_id: session[:user_id])
  end

  def update
    @users = User.all
    @redlights = Redlight.all
    @user_redlight = Redlight.find(params[:id])
    if @user_redlight.user_id == session[:user_id]
      @user_redlight.update_attributes(redlight_params)
      redirect_to '/dashboard'
    else
      flash[:access] = "Unauthorized access, please contact your administrator if you believe this error is incorrect."
      redirect_to '/dashboard'
    end
  end

  def destroy
  	@redlight = Redlight.find_by(user_id: session[:user_id])
  	@redlight.destroy
  	redirect_to '/dashboard'
  end 

  private
  def redlight_params
    params.require(:redlight).permit(:user_id, :problems)
  end
end