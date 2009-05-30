require 'rubygems'
require 'httparty'
require 'mash'
require 'pp'

module A2WS
  class Base
    include HTTParty
    base_uri 'http://ecs.amazonaws.com'
    default_params :Service => 'AWSECommerceService'
  end

  class ItemSearch < Base
    default_params :Operation => 'ItemSearch'

    def initialize(api_key, search_index)
      self.class.default_params :SearchIndex => search_index,  :AWSAccessKeyId => api_key
    end

    def query(options = {})
      result = self.class.get('/onca/xml', options)

      items = result["ItemSearchResponse"]["Items"]
      if items['Request']['IsValid'] == 'True'
        items['Item'].collect {|i| i['ItemAttributes'].to_mash }
      else
        raise items['Request']['Errors']['Error']['Message']
      end
    end
  end
  
end