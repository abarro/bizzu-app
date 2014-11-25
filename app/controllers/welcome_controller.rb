class WelcomeController < ApplicationController
  def index
    @users = User.order("sales DESC")
  end
end
