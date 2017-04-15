class FriendsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:user_id])
    current_user.friend_request(@user)
    sender_url = url_for(current_user)
    Notification.create(recipient: @user, actor: current_user, action: "sent a friend request", notifiable: @user, url: sender_url  )
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.remove_friend(@user)
  end
  
  def accept
    @user = User.find(params[:user_id])
    @user.accept_request(current_user)
    acceptor_url = url_for(@user)
    Notification.create(recipient: current_user, actor: @user, action: "accepted your friend request", notifiable: @user, url: acceptor_url )
  end
  
end
