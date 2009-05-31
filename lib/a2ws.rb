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
    attr_accessor :items
    
    default_params :Operation => 'ItemSearch'

    def initialize(api_key, search_index = :All)
      self.class.default_params :SearchIndex => search_index,  :AWSAccessKeyId => api_key
    end

    def find(keywords, options = {})
      options.merge!({:Keywords => keywords})
      puts options.inspect
      result = self.class.get('/onca/xml', :query => options)

      @items = result["ItemSearchResponse"]["Items"]
      if @items['Request']['IsValid'] == 'True'
        @items['Item'].collect do |i|
          Mash.new downcase_keys(i)
        end
      else
        raise @items['Request']['Errors']['Error']['Message']
      end
    end
    
    protected
    
    def downcase_keys(hash)
      new_hash = {}
      hash.keys.each do |key|
        value = hash.delete(key)
        new_hash[downcase_key(key)] = value
        new_hash[downcase_key(key)] = downcase_keys(value) if value.is_a?(Hash)
        new_hash[downcase_key(key)] = value.each{|p| downcase_keys(p) if p.is_a?(Hash)} if value.is_a?(Array)
      end
      new_hash
    end
    
    def downcase_key(key)
      key.titlecase.downcase.gsub(' ', '_')
    end
    
  end
  
end