class Review < ApplicationRecord
  belongs_to :item, required: false
  belongs_to :user, required: false
  validates :body, presence: true,
                    length: { minimum: 10 }
  #Makes sure each User can only make one review per product
  validates_uniqueness_of :user_id, :scope => :item_id
  
end
