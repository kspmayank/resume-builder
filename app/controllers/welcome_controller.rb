class WelcomeController < ApplicationController
  def index
  end
  
  def templates
  	
  end

  def template1
  	render :layout => "template1"
  end
end
