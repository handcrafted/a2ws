module A2WS


  class Item
    include Methodize
  
    def item_attributes
      ItemAttributes.new @data_hash["item_attributes"]
    end
    
    def images
      ImageSearch.find(@data_hash["asin"])
    end
  
  end
  
  class ItemAttributes
    include Methodize
    
  end
  
  
end