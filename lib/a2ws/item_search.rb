module A2WS

  class ItemSearch < Base
    attr_accessor :items, :search_index

    def initialize(api_key, search_index = :All)
      @search_index = search_index
      self.class.default_params :AWSAccessKeyId => api_key
    end

    def find(keywords, options = {})
      options.merge!({:Keywords => keywords, :SearchIndex => @search_index})
      puts options.inspect
      result = self.class.get('/onca/xml', :query => options)

      @items = result["ItemSearchResponse"]["Items"]
      if @items['Request']['IsValid'] == 'True'
        @items['Item'].collect do |i|
          Item.new downcase_keys(i)
        end
      else
        raise @items['Request']['Errors']['Error']['Message']
      end
    end
    
  end
  
end