require 'rubygems'
require 'httparty'
require 'mash'
require 'activesupport'
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

    def find(options = {})
      result = self.class.get('/onca/xml', options)

      items = result["ItemSearchResponse"]["Items"]
      if items['Request']['IsValid'] == 'True'
        items['Item'].collect do |i|
          i['ItemAttributes'].inject({}) {|h, j| h[j.first.titlecase.downcase.gsub(' ', '_')] = j.last ; h}.to_mash
        end
      else
        raise items['Request']['Errors']['Error']['Message']
      end
    end
  end
  
end