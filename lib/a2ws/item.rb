module A2WS


  class Item
    attr_accessor :item_hash
  
    def initialize(item)
      @item_hash = item
    end
  
    def item_attributes
      ItemAttributes.new @item_hash["item_attributes"]
    end
    
    def images
      ImageSearch.new(@item_hash["asin"]).find
    end
  
    def method_missing(meth,*args)
      if @item_hash.keys.include(meth.to_s)
        @item_hash[meth.to_s]
      else
        super
      end
    end
  
  end
  
  class ItemAttributes
    attr_accessor :item_attributes_hash
    
    def initialize(item_attributes)
      @item_attributes_hash = item_attributes
    end
    
    def method_missing(meth,*args)
      @item_attributes_hash[meth.to_s]
    end
    
  end
  
  
end