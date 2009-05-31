module A2WS
  class Base
    include HTTParty
    base_uri 'http://ecs.amazonaws.com'
    default_params :Service => 'AWSECommerceService', :Operation => 'ItemSearch'
    
    private
    
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