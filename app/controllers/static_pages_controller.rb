class StaticPagesController < ApplicationController
  
  #Passes the needed values to populate the homepage
  def home
    @categories = Category.all
    @items = Item.all
    #Featured items are had picked manually
    @itemfeatured1 = Item.find_by_id(18)
    @itemfeatured2 = Item.find_by_id(2)
    @itemfeatured3 = Item.find_by_id(7)
    @new_arrival = Item.order(created_at: :asc).last(5)
  end
  
  def about
  end
  
  def contact
  end
  
end

