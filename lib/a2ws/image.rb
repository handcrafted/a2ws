module A2WS


  class Image
    include Methodize
    attr_accessor :size
    
    
    def initialize(size, data)
      @size, @data_hash = size, data
    end
    
  end
  
  
end