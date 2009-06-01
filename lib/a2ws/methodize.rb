module Methodize
  
  def method_missing(meth,*args)
    if @data_hash.keys.include?(meth.to_s)
      @data_hash[meth.to_s]
    else
      super
    end
  end
  
end