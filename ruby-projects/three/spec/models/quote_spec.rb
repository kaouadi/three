require 'spec_helper'

describe Quote do
  
  before(:each) do
    @attr ={:name => "toto"}
    @quote = Quote.create!(@attr)
    
  end
  
  it "should create quote" do
    @quote.name.should==@attr[:name]
  end
 
end
