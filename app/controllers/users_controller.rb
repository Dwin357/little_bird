class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @posts = current_user!.stream_posts
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def user_from_params
    User.find_by_id(params[:id])
  end
end