module A2WS


  class Image
    attr_accessor :size, :data_hash
    include Methodize
    
    def initialize(size, data)
      @size, @data_hash = size, data
    end
    
  end
  
  
end