class Node
    attr_accessor :left, :right, :value
    
    def initialize(left = nil, right = nil, value = nil)
        @left = left
        @right = right
        @value = value
    end

end