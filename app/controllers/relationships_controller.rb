class RelationshipsController < ApplicationController

      # followするアクション
  def create
    current_user.follow(params[:id])
    redirect_back(fallback_location: users_path)
  end
      # unfollowするアクション
  def destroy
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: users_path)
  end

#下View画面のアクション

  def follows
    @user  = User.find(params[:user_id])
  end

  def followers
    @user  = User.find(params[:user_id])
  end
end