class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @user = current_user
    @publisher = current_user.publisher
    @reader = current_user.reader
  end
end
