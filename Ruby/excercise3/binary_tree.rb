class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(e)
    unless @root
      @root = Node.new(e, nil)
    else
      find_lowest(@root, e).add_child e
    end
  end

  private
  def find_lowest(node, e)
    if node.is_leaf? or not node.is_full? then
      node
    else
      find_lowest(node.where?(e), e)
    end
  end
end

class TreeNode
  attr_accessor :value, :parent

  def initialize(v, p)
    @value = v
    @parent = p
  end

  def is_leaf?
  end
end

class Node < TreeNode
  attr_accessor :children

  def initialize(v, p)
    @children = []
    super v, p
  end

  def is_leaf?
    false
  end

  def is_full?
    @children.size === 2 and @children[0] and @children[1]
  end

  def where?(e)
    unless is_full? then self end
    (@value < e) ? @children[1] : @children[0]
  end

  def add_child(e)
    choose_side(Leaf.new(e, self))
  end

  def leaf_to_node(leaf, node)
    choose_side(node)
  end

  private
  def choose_side(node)
    if node.value < @value
      @children[0] = node
    else
      @children[1] = node
    end
  end

end

class Leaf < TreeNode
  def initialize(v, p)
    super v, p
  end

  def is_leaf?
    true
  end

  def add_child(e)
    node = Node.new(@value, @parent)
    node.add_child(e)
    @parent.leaf_to_node(self, node)
  end
end

data = [54, 22, 76, 40, 15, 18, 4, 13, 16, 77, 28, 38]
t = BinaryTree.new

data.each do |d|
  t.add(d)
end


puts t
