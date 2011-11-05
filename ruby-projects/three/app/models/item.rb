class Item < ActiveRecord::Base
  attr_accessible :ref, :description
  
  has_many :quote_lines
end
