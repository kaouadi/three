class Quote < ActiveRecord::Base
  attr_accessible :name, :quote_lines_attributes

   has_many :quote_lines #, :dependent => :destroy
   
   accepts_nested_attributes_for :quote_lines, :allow_destroy => true
end
