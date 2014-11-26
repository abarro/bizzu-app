class WelcomeController < ApplicationController
  def index
    @users = User.order("sales DESC")
  end

  def regulamento
  end

  def premios
  end

  def ranking
  end
  
end
