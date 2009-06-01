module A2WS


  class ImageSearch < Base
    
    def self.find(item) 
      items = get('/onca/xml', :query => {:ItemId => item, :Operation => "ItemLookup", :ResponseGroup => "Images"})
      puts items.inspect
      if items['ItemLookupResponse']["Items"]["Request"]['IsValid'] == 'True'
        items["ItemLookupResponse"]["Items"]["Item"].delete("ImageSets")
        items["ItemLookupResponse"]["Items"]["Item"].delete("ASIN")
        downcase_keys(items["ItemLookupResponse"]["Items"]["Item"]).collect { |size, data| Image.new(size, data) }
      else
        raise items['Request']['Errors']['Error']['Message']
      end
    end
    
  end
  
  
end