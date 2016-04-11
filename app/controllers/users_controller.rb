class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @posts = current_user!.stream_posts
  end

  def edit
    @user = current_user!
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render "new"
    end
  end

  def update
    if valid_edit?
      @user = user_from_params.assign_attributes(user_params)
      if @user.save
        redirect_to user_path(@user)
      else
        flash[:errors] = @user.errors.full_messages
        render "edit"
      end
    else
      flash[:errors] = ["invalid edit permission"]
      render "edit"
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def user_from_params
    @user ||= User.find_by_id(params[:id])
  end

  def valid_edit?
    user_from_params && current_user == user_from_params
  end
end