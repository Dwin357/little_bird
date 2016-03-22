class RootController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to new_session_path
    end
  end
end