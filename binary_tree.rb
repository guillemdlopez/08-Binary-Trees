require_relative 'node'

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
bt.root.left.left = Node.new(nil,nil,2)
bt.root.left.left.left = Node.new(nil,nil,53)
bt.root.left.left.left.left = Node.new(nil,nil,55)
bt.root.right = Node.new(nil,nil,90)
bt.root.right.right = Node.new(nil,nil,99)
bt.root.right.right.right = Node.new(nil,nil,89)
p bt.find(89)

# height -> longest path from the node to any leaf
# the height of a tree is the height of its root
# height of empty tree = -1
# height of ay leaf node = 0
p bt.getHeight(bt.root)
