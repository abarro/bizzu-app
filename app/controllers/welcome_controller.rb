class WelcomeController < ApplicationController
  def index
    
    @users = User.all
    @sales_total = User.sum(:sales)

  end

  def regulamento
  end
  
end
