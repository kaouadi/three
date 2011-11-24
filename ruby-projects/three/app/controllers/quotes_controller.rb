class QuotesController < ApplicationController
  
  def new
    @quote = Quote.new(name: "Quote 1")
    4.times do |i|
      quote_line = @quote.quote_lines.build(quantity: i)
      quote_line.item = Item.new(description: "Item #{i}")
    end
  end

  def create
    @quote = Quote.create(params[:quote])
    redirect_to edit_quote_path(@quote)
   
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.update_attributes!(params[:quote])
    redirect_to edit_quote_path
  end

  def show
    @quote = Quote.find(params[:id])
  end
  
end
  

