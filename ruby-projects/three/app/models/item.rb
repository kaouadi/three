class Item < ActiveRecord::Base
  attr_accessible :ref, :description, :price
  
  has_many :quote_lines
end
