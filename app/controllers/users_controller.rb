class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :correct_user, only: [:index]

  add_breadcrumb "アカウント管理"

  def index
  	@users = User.all
    add_breadcrumb "ユーザー一覧", users_path
=======
  def index
  	@users = User.all
>>>>>>> e5de3266dfaed05c7acf7cc7be1b9c78a201aaa4
  end

  def show
  	@user = User.find(params[:id])
<<<<<<< HEAD
  	@posts = @user.posts.all.includes(:post_images)
  	if current_user.id == @user.id
      add_breadcrumb "マイページ", :user_path
    else
      add_breadcrumb @user.username, :user_path
    end
  end

  private
    def correct_user
      if current_user.admin?
      else
        redirect_to user_path
      end
    end
end

=======
  end
end
>>>>>>> e5de3266dfaed05c7acf7cc7be1b9c78a201aaa4
