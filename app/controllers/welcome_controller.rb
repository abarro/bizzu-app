class WelcomeController < ApplicationController
  def index
    
    @users = User.all

  end

  def regulamento
  end
  
end
