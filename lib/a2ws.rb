require 'rubygems'
gem 'httparty', '0.4.3'
require 'httparty'

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
      result["ItemSearchResponse"]["Items"]
    end
  end
  
end