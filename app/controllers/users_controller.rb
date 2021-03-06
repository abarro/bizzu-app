class UsersController < ApplicationController

  # http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show, :new]
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Obrigado por se registrar"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_url, notice: "Cota cadastrada"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :cpf, :sales, :avatar, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Por favor faça login."
        redirect_to login_url
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
