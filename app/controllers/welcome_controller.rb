class WelcomeController < ApplicationController
  def index
    
    @users = User.all

  end

  def regulamento
  end

  def premios
  end

  def ranking
  end
  
end
