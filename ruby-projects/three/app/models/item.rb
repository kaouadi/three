class Item < ActiveRecord::Base
  attr_accessible :ref, :name, :price

   #has_many :quotes, :through => :quote_lines
   has_many :quote_lines
end
