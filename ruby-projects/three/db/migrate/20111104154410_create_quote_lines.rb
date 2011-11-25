class CreateQuoteLines < ActiveRecord::Migration
  def self.up
    create_table :quote_lines do |t|
      t.references :quote, :item
      t.integer :quantity
      t.decimal :discount_rate
      t.decimal :taxe
      t.decimal :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :quote_lines
  end
end
