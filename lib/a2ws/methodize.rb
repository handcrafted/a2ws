module Methodize
  
  attr_accessor :data_hash
  
  def initialize(attributes)
    @data_hash = attributes
  end
  
  def method_missing(meth,*args)
    if @data_hash.keys.include?(meth.to_s)
      @data_hash[meth.to_s]
    else
      super
    end
  end
  
end