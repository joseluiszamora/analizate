class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:profile, :edit, :update, :destroy]

  #load_and_authorize_resource

  respond_to :html

  def index
    @users = User.all
    respond_with @users
  end

  def profile
    render :show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    #respond_with @user
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, notice: 'User was successfully created.'
    else
      render :action => "new"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :username, :password, :password_confirmation, :phone, :cellular, :address, :birthday, :notes, :role, :image)
    end
end