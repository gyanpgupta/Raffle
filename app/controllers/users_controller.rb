class UsersController < ApplicationController
  before_action :set_user, only: %w[show]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html {
          redirect_to @user, notice: I18n.t('message', user_count: @user.users_count,
                                                       percentage: @user.winning_probability) 
        }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :prize)
  end
end
