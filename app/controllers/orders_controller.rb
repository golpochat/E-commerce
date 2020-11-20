class OrdersController < ApplicationController
  before_action :logged_in_user, only: :sales
  before_action :admin_user, only: :sales
  before_action :set_order, only: [:show, :edit, :update, :destroy, :payment_confirmation]

  # GET /orders
  # GET /orders.json
  #Checks for admin and returns a select list of orders depending
  def index
    if current_user.admin?
      @orders = Order.all.paginate(:page => params[:page], per_page: 10)
    else
      @orders = Order.all.where(user_id: current_user.id).paginate(:page => params[:page], per_page: 10)
    end
  end
  
  #Renders all sales that have the status paid
  def sales
    @orders = Order.all.where(status: "Paid by Paypal")
    render action: :sales
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
   @orderitems = Orderitem.where(order_id: @order)
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
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
  
  #Sets the status of the order to paid and sends and email to the user about their order
  def payment_confirmation
    @order.update_attribute(:status, "Paid by Paypal")
    @user = current_user
    @user.send_order_email(@order)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:order_date, :user_id, :status)
    end
    
    # Checks that the user is logged in
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Checks if the user to an admin or redirects to home page
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
