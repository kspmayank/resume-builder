class WelcomeController < ApplicationController
  def index
  end
  
  def templates
  	
  end

  def template1
    # if session[:user_id]
      render :layout => "template1"
    # else    
      # redirect_to '/'
    # end 
  end

  def template2
    # if session[:user_id]
      render :layout => "template2"
    # else    
      # redirect_to '/'
    # end 
  end

  def template3
    # if session[:user_id]
      render :layout => "template3"
    # else    
      # redirect_to '/'
    # end 
  end
end
