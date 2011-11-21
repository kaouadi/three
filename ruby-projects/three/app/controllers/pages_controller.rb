class PagesController < ApplicationController
  
  def new
    @status = "proposed"
  end

  def create
    @status = "created"
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
