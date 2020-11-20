class Item < ApplicationRecord
    
    #Sets the relationship for review and deletes them if the item is destroyed
    has_many :reviews, dependent: :destroy
    
    validates :category, presence: true
    validates :title, presence:true
    validates :author, presence:true
    validates :description, presence:true
    validates :price, presence:true,numericality: true
    validates :image_url, presence:true
    
    #Gets the average review for an item
    def score
        self.reviews.average('rating')
    end
    
    #Returns how many blank stars to display
    def blank_stars
        5 - score.to_i
    end
    
    #If the stock goes below 1 this triggers the html to mark an item out of stock
    def stock_limit
        stock <= 0
    end
    
    #Following scopes are used to sort the products
    scope :expensive, -> { order(price: :desc) }
    scope :cheapest, -> { order(price: :asc) }
    
    #Groups reviews average rating and items tables so that we can sort by rating
    scope :bestrated, -> { (where("items.id in (select item_id from reviews)").group('items.id, items.title, items.author,items.description,items.price,items.image_url,items.category,items.stock').joins(:reviews).order('AVG(reviews.rating) DESC'))}
    scope :lowestrated, -> { (where("items.id in (select item_id from reviews)").group('items.id, items.title, items.author,items.description,items.price,items.image_url,items.category,items.stock').joins(:reviews).order('AVG(reviews.rating) ASC'))}
    
end
