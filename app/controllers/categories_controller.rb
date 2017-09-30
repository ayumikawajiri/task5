class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:index, :new, :create, :edit, :update, :destroy]

  

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.page(params[:page])
    add_breadcrumb "アカウント管理"
    add_breadcrumb '管理者メニュー', :menu_path
    add_breadcrumb 'カテゴリ一覧'
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @posts = @category.posts.page(params[:page]).includes(:post_images)
    @image = PostImage.first
    add_breadcrumb "商品"
    add_breadcrumb @category.categoryname, :category_path
  end

  # GET /categories/new
  def new
    @category = Category.new
    add_breadcrumb "アカウント管理"
    add_breadcrumb '管理者メニュー', :menu_path
    add_breadcrumb 'カテゴリ作成'
  end

  # GET /categories/1/edit
  def edit
    add_breadcrumb "アカウント管理"
    add_breadcrumb '管理者メニュー', :menu_path
    add_breadcrumb 'カテゴリ編集'
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render :index, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:categoryname)
    end

    def correct_user
      #category = Category.find(params[:id])
      if current_user.admin?
      else
        redirect_to root_path
      end
    end
end
