module A2WS

  class ItemSearch < Base

    def self.find(keywords, search_index = :All, options = {})
      options.merge!({:Keywords => keywords, :SearchIndex => search_index})
      result = get('/onca/xml', :query => options)

      items = result["ItemSearchResponse"]["Items"]
      if items['Request']['IsValid'] == 'True'
        items['Item'].collect do |i|
          Item.new downcase_keys(i)
        end
      else
        raise items['Request']['Errors']['Error']['Message']
      end
    end
    
  end
  
end