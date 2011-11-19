class PagesController < ApplicationController
  
  def new
  end

  def create
    
    respond_to do |format|
      format.html{ redirect_to new_page_path}
      format.js
    end
  end

  def edit
  end

  def show
  end

end
