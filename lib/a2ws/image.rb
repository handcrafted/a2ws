module A2WS


  class Image
    attr_accessor :size, :data
    
    def initialize(size, data)
      @size, @data = size, data
    end
    
    
    def method_missing(meth,*args)
      @data[meth.to_s]
    end
    
  end
  
  
end