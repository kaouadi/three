class QuoteLine < ActiveRecord::Base
  attr_accessible :quantity, :item_attributes, :taxe, :discount_rate, :amount

  belongs_to :quote
  belongs_to :item
  
  accepts_nested_attributes_for :item
  
  before_save :initialyze_quantity,:initialyze_taxe,:initialyze_discount_rate
  
  private
  
  def initialyze_quantity
    self.quantity = self.quantity == 0 ||  self.quantity.blank? ? 1 : self.quantity
  end
  
  def initialyze_taxe
    self.taxe = self.taxe == 0 ||  self.taxe.blank? ? 0.1960 : self.taxe
  end
  
  def initialyze_discount_rate
    self.discount_rate =  self.discount_rate.blank? ? 0 : self.discount_rate
  end
  
  def last_save_taxe
    
  end
  
end
