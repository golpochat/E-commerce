class CartController < ApplicationController
 
 def index
 end
 
 #Adds an item to the cart
 def add
   # get the Id of the product
   id = params[:id]
   # if the cart is already been created, use existing cart else create a blank cart
   if session[:cart] then
    cart = session[:cart]
   else
    session[:cart] = {}
    cart = session[:cart]
   end
   #If the product is already added it increments by 1 else product set to 1
  if cart[id] then
    cart[id] = cart[id] + 1
  else
    cart[id]= 1
  end
  redirect_to :action => :index
 end
 
 #Increases item quantity in cart by 1
 def increase
  id = params[:id]
  cart = session[:cart]
  cart[id] = cart[id] + 1
  redirect_to :action => :index
 end
 
 #Reduces the item quantity in cary by 1
 def decrease
  id = params[:id]
  cart = session[:cart]
  if cart[id] == 1 then
   cart.delete id
  else
   cart[id] = cart[id] - 1
  end
  #Taking us to cart index[view] page
  redirect_to :action => :index
 end

 #Sets session variable to nil and bring back to index
 def clear
  session[:cart] = nil
  redirect_to :action => :index
 end

 #Passes a cart to display
 def index
  if session[:cart] then
   @cart = session[:cart]
  else
   @cart = {}
  end
 end
 
 def remove
  id = params[:id]
  cart = session[:cart]
  cart.delete id
  redirect_to :action => :index
 end
 
 # Creating an order
 def checkout
  # Step 1: Get the current user
  @user = User.find(current_user.id)
  #@user = User.find(1)
  
  # Step 2: Create a new order and associate it with the current user
  @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending')
  @order.save
  
  # Step 3: For each item in the cart, create a new item on the order!!
  @cart = session[:cart] || {} # Get the content of the Cart
  @cart.each do | id, quantity |
   #Reduces the stock as item is added to checkout
   item = Item.find_by_id(id)
   item.stock -= quantity
    
   @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price=> item.price)
   @orderitem.save
   item.save
  end
  
  @orders = Order.last
  @orderitems = Orderitem.where(order_id: Order.last)
  session[:cart] = nil
  @user = current_user
  @user.send_order_email(@order)
 end


end
