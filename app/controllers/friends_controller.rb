class FriendsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:user_id])
    current_user.friend_request(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.remove_friend(@user)
  end
  
  def accept
    @user = User.find(params[:user_id])
    @user.accept_request(current_user)
  end
  
end
