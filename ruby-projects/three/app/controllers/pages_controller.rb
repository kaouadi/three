class PagesController < ApplicationController
  #respond_to :html, :xml, :json, :js
  def new
    @status = "created"
  end

  def create
    @status = params[:status]
    respond_to do |format|
      format.html{ redirect_to new_page_path}
      format.js
    end
  end

  def edit
  end

  def show
    @quote = Quote.find_by_id(params[:id])
    #respond_with(@quote)
  end
  
  def index
    @quotes = Quote.all
    respond_to do |format|
      format.html{render :json => @quotes}
      format.xml{render :xml =>@quotes}
      format.json{render :json =>@quotes}
    end
    #render :json => @quotes
    #respond_with(@quotes) do |format|
     # format.js {}
    #end
  end

end
