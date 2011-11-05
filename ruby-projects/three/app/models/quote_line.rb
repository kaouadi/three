class QuoteLine < ActiveRecord::Base
  attr_accessible :quantity, :item_attributes
  
  belongs_to :quote
  belongs_to :item
  
  accepts_nested_attributes_for :item
end
