class FriendsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:user_id])
    current_user.friend_request(@user)
    
    # Add a notification, need to test if notifiable type is te right one
    Notification.create(recipient: @user, actor: current_user, action: "sent a friend request", notifiable: @user )
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.remove_friend(@user)
  end
  
  def accept
    @user = User.find(params[:user_id])
    @user.accept_request(current_user)
    Notification.create(recipient: current_user, actor: @user, action: "accepted your friend request", notifiable: @user )
  end
  
end
