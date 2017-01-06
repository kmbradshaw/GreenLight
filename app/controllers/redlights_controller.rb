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