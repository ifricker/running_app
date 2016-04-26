class UsersController < ApplicationController
  # before_action :set_user

  def show
    @user = current_user
  end
end
