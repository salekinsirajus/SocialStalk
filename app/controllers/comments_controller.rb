class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: :create
  respond_to :js

  def create
    @comment = @commentable.comments.new do |comment|
      comment.comment = params[:comment_text]
      comment.user = current_user
    end
    @comment.save
    comment_url = url_for(@commentable)
    post_owner = @commentable.activities.last.owner
    #post_owner = @commetable.activities.recipient
    Notification.create(recipient: post_owner, actor: current_user, action: "commented", url: comment_url)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment_id = params[:id]
    @comment.destroy
  end

  private
  def find_commentable
    @commentable_type = params[:commentable_type].classify
    @commentable = @commentable_type.constantize.find(params[:commentable_id])
  end
end
