class PasswordResetsController < ApplicationController
	def create
	  user = User.find_by_email(params[:email])
	  user.send_password_reset if user
	  if user
	  	redirect_to root_url, :notice => "Email sent with password reset instructions."
	  else
	  	redirect_to '/signup', :notice => "No Account Found! Signup!"
	  end
	end

	def edit
	  @user = User.find_by_password_reset_token!(params[:id])
	end

	def update
	  @user = User.find_by_password_reset_token!(params[:id])
	  if @user.password_reset_sent_at < 24.hours.ago
	    redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif params["user"]["password"]==params["user"]["password_confirmation"]
		@user.update_attributes(password_reset_params)
	    redirect_to root_url, :notice => "Password has been reset!"
	  else
	    render :edit, :notice => "Passwords Mismatch"
	  end
	end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def password_reset_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
