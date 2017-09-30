class UsersController < ApplicationController

  before_action :correct_user, only: [:index, :menu]

  add_breadcrumb "アカウント管理"

  def index
  	@users = User.all
    add_breadcrumb '管理者メニュー', :menu_path
    add_breadcrumb "ユーザー一覧", :users_path
  end

  def show
  	@user = User.find(params[:id])
    @orders = @user.orders.all.includes(:post)
  	@posts = @user.posts.all.includes(:post_images)
    @image = PostImage.first

    if user_signed_in? && current_user.id == @user.id
      add_breadcrumb "マイページ", :user_path
    else
      add_breadcrumb @user.username, :user_path
    end
  end

  def menu
    add_breadcrumb "管理者メニュー", :menu_path    
  end

  private
    def correct_user
      if current_user.admin?
      else
        redirect_to user_path
      end
    end
end


