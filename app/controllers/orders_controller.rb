class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:index]

  add_breadcrumb "注文"

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.order(created_at: :desc).page(params[:page]).includes(:post, :user)
    add_breadcrumb '管理者メニュー', :menu_path
    add_breadcrumb "購入履歴一覧"
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    # @post = Post.find(params[:post_id])
    add_breadcrumb "注文者情報"
  end

  # GET /orders/new
  def new
    @order = Order.new
    @post = Post.find(params[:post_id])
    add_breadcrumb "新規注文"
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  # GET /orders/1/edit
  def edit
    add_breadcrumb "購入者情報", :order_path
    add_breadcrumb "編集"
  end

  # POST /orders
  # POST /orders.json
  def create
    @post = Post.find(params[:post_id])
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.post_id = @post.id

    respond_to do |format|
      if @order.save
        OrderMailer.send_when_order(@order).deliver
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:post_id, :user_id, :ordername, :orderphone, :orderemail, :orderaddress)
    end

    def correct_user
      # order = Order.find(params[:id])
      if current_user.admin?
      else
        redirect_to root_path
      end
    end
end
