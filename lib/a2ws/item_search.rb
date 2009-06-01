module A2WS

  class ItemSearch < Base
    attr_accessor :items, :search_index

    def initialize(search_index = :All)
      @search_index = search_index
    end

    def find(keywords, options = {})
      options.merge!({:Keywords => keywords, :SearchIndex => @search_index})
      puts options.inspect
      result = self.class.get('/onca/xml', :query => options)

      @items = result["ItemSearchResponse"]["Items"]
      if @items['Request']['IsValid'] == 'True'
        @items['Item'].collect do |i|
          AW2S::Item.new downcase_keys(i)
        end
      else
        raise @items['Request']['Errors']['Error']['Message']
      end
    end
    
  end
  
end