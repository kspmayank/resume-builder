class WelcomeController < ApplicationController
  def index
  end
  
  def templates
  	
  end

  def template1
    if session[:user_id]
	  	render :layout => "template1"
    else  	
      redirect_to '/'
    end	
  end
end
