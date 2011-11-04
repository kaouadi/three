class QuoteLine < ActiveRecord::Base
  
  attr_accessible :item_attributes, :quantity
   belongs_to :item
   belongs_to :quote
   accepts_nested_attributes_for :item
end
