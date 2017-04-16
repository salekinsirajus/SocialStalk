class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :check_ownership, only: [:edit, :update]
  respond_to :html, :js

  def show
    @activities = PublicActivity::Activity.where(owner: @user).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    
    if current_user != @user
      viewer = url_for(current_user)
      Notification.create(recipient: @user, actor: current_user, action: "viewed your profile", url:viewer)
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def deactivate
  end

  def friends
    @friends = @user.friends.paginate(page: params[:page])
  end

  def followers
    @followers = @user.user_followers.paginate(page: params[:page])
  end

  def mentionable
    render json: @user.following_users.as_json(only: [:id, :name]), root: false
  end

  private

  def user_params
    params.require(:user).permit(:name, :interests, :avatar, :cover, :school_or_work,
                                 :sex, :dob, :location, :phone_number)
  end

  def check_ownership
    redirect_to current_user, notice: 'Not Authorized' unless @user == current_user
  end

  def set_user
    # @user = User.friendly.find(params[:id])
    @user = params[:id] ? User.friendly.find(params[:id]) : current_user
  end
end