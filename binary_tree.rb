require_relative 'node'
require_relative 'queue'

class BinaryTree
    attr_accessor :root

    def initialize(node)
        @root = node
    end

    def find(value)
        return true if root.value == value

        return find_node(root, value)
    end

    def getHeight(node)
        return -1 if node.nil?
        left_h = getHeight(node.left)
        right_h = getHeight(node.right)

        return left_h > right_h ? left_h + 1 :  right_h + 1
    end


    def level_order_traversal(root)
        # keep reference of all the children in a queue (FIFO)
        # [ F,  ]
        # take first node out of the queue enad enqueue the children
        return if root.nil?

        queue = [root]
        
        while !queue.empty?            
            current = queue.shift
            queue << current.left unless current.left.nil?
            queue << current.right  unless current.right.nil? 
            
            print "#{current.value} "
        end  
    end

    private

    def find_node(node, value)
        return false unless node
        return true if node.value == value

        find_node(node.left, value) || find_node(node.right, value)
    end

    def find_node_stack(node, value)
        stack = [node]

        until stack.empty?
            node = stack.pop

            return true if node.value == value
            
            stack << node.left if node.left
            stack << node.right if node.right
        end

        false
    end
end

bt = BinaryTree.new(Node.new(nil,nil,1))
left = Node.new(nil,nil,5)
bt.root.left = left
# bt.root.left.left = Node.new(nil,nil,2)
# bt.root.left.left.left = Node.new(nil,nil,53)
# bt.root.left.left.left.left = Node.new(nil,nil,55)
bt.root.right = Node.new(nil,nil,90)
# bt.root.right.right = Node.new(nil,nil,99)
# bt.root.right.right.right = Node.new(nil,nil,89)
# p bt.find(89)

# height of empty tree = -1
# height of ay leaf node = 0
# p bt.getHeight(bt.root)
bt.level_order_traversal(bt.root)
