require 'spec_helper'

describe Quote do
  
  before(:each) do
    @attr ={:name => "toto"}
    @params = {:quote => {:name => "toto", :quote_lines_attributes => [
                    { :quantity =>1, :taxe =>0.196, :discount_rate => 0.05, :item_attributes =>{:description => "ref 3000",:ref => "3000",:price => 100}},
                    { :quantity =>1, :taxe =>0.196, :discount_rate => 0.05, :item_attributes =>{:description => "ref 1000",:ref => "1000",:price => 200}},
                    { :quantity =>1, :taxe =>0.196, :discount_rate => 0.05, :item_attributes =>{:description => "ref 5000",:ref => "5000",:price => 300}}
                          ] 
                            }
                             }
                            
    @quote_one = Quote.create!(@attr)

  end
  
  it "should create quote" do
    @quote_one.name.should==@attr[:name]
  end
  
  it "create quote" do
     quote = Quote.create!(@params[:quote])
    puts "Quote name "+ quote.name
    quote.quote_lines.each do |line|
      puts "quote_line quantity " + line.quantity.to_s
      puts "item ref "+line.item.ref.to_s
    end
  end
    
  it "update quote" do 
        quote = Quote.create!(@params[:quote])
        param_update = {:quote => {:name => "toto", :quote_lines_attributes => [
                        { :id =>1, :quantity =>5, :item_attributes =>{:ref => "Update XXX"}}
                              ] 
                                }
                                 }
        quote.attributes = param_update[:quote]
         quote.quote_lines.each do |line|
            puts "quote_line quantity " + line.quantity.to_s
            puts "item ref "+line.item.ref.to_s
          end
      
    end
    
  it "delete quote line" do 
          quote = Quote.create!(@params[:quote])
          param_delete = {:quote => { :quote_lines_attributes => [
                          { :id =>1, :_destroy => '1' }
                                ] 
                                  }
                                   }
          quote.attributes = param_delete[:quote]
          quote.save
           quote.quote_lines.each do |line|
              puts "quote_line quantity " + line.quantity.to_s
              puts "item ref "+line.item.ref.to_s
            end
          puts "Lenght quoteline :" + quote.reload.quote_lines.length.to_s
          items = Item.all
          puts "nombre de :"+items.length.to_s

      end
    
    
    describe "Quote calcul" do
      
      before(:each) do
        @quote = Quote.create!(@params[:quote])
      end
      
      it "should valid subtotal" do
        @quote.subtotal.should == 600
      end
      
      it "should valid total" do
        @quote.total.should == 681.72
      end
      
      it "should valid rate" do
        @quote.rate.should == 30
      end
        
      it "should valid taxe" do
        @quote.taxe.should == 111.72
        
      end
    end
    describe "initialize quote_line" do
      
      before(:each) do
        @attr ={:name => "toto"}
        @params = {:quote => {:name => "toto", :quote_lines_attributes => [
                        { :quantity =>0, :taxe =>0.196, :discount_rate => 0.05, :item_attributes =>{:description => "ref 3000",:ref => "3000",:price => 100}},
                        { :taxe =>0.196, :discount_rate => 0.05, :item_attributes =>{:description => "ref 1000",:ref => "1000",:price => 200}},
                        { :taxe =>0.196, :discount_rate => 0.05, :item_attributes =>{:description => "ref 5000",:ref => "5000",:price => 300}}
                              ] 
                                }
                                 }
        @quote = Quote.create!(@params[:quote])                       
        end
      
         it "should valid subtotal" do
            @quote.subtotal.should == 600
          end

          it "should valid total" do
            @quote.total.should == 681.72
          end

          it "should valid rate" do
            @quote.rate.should == 30
          end

          it "should valid taxe" do
            @quote.taxe.should == 111.72

          end
      
      
    end
  end

