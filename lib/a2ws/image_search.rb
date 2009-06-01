module A2WS


  class ImageSearch < Base
    attr_accessor :item_id
    
    def initialize(item_id)
      @item_id = item_id
    end
    
    def find
      self.class.default_params :ResponseGroup => "Images"
      result = self.class.get('/onca/xml', :query => {:ItemId => @item_id, :Operation => "ItemLookup"})
      result["ItemLookupResponse"]["Items"]["Item"].delete("ImageSets")
      result["ItemLookupResponse"]["Items"]["Item"].delete("ASIN")
      downcase_keys(result["ItemLookupResponse"]["Items"]["Item"]).collect { |size, data| AW2S::Image.new(size, data) }
    end
    
  end
  
  
end