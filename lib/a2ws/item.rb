module A2WS


  class Item
    attr_accessor :data_hash
    include Methodize
  
    def initialize(item)
      @data_hash = item
    end
  
    def item_attributes
      ItemAttributes.new @data_hash["item_attributes"]
    end
    
    def images
      ImageSearch.new(@data_hash["asin"]).find
    end
  
  end
  
  class ItemAttributes
    attr_accessor :data_hash
    include Methodize
    
    def initialize(item_attributes)
      @data_hash = item_attributes
    end
    
  end
  
  
end