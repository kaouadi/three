class Quote < ActiveRecord::Base
  attr_accessible :name, :quote_lines_attributes
  #attr_accessor :subtotal, :total
  
  has_many :quote_lines, :dependent => :destroy
  
  accepts_nested_attributes_for :quote_lines, :allow_destroy => true
  
  
  
 def subtotal
    quote_lines.collect{|x| x.quantity * x.item.price}.sum
 end
 
 def total
   quote_lines.collect{|x| x.quantity * (1 + x.taxe) * (1-x.discount_rate) * x.item.price}.sum
 end
 
 def taxe
    quote_lines.collect{|x| x.quantity * x.item.price * (1-x.discount_rate) * (x.taxe) }.sum
 end
 
 def rate
    quote_lines.collect{|x| x.quantity * (x.discount_rate) * x.item.price}.sum
   
 end
 
 
 
end
