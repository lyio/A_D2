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

  def delete(e)
    node = find(root, e)
    #rebalancing tree
    node.parent.remove_child(node)
    e
  end

  def find(node, e)
    if node.is_leaf? and node.value != e then
      nil
    else
      if node.value == e then
        node
      else
        find(node.where?(e), e)
      end
    end
  end

  private
  def find_lowest(node, e)
    if node.is_leaf? or not node.is_full?
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
end

class Node < TreeNode
  attr_accessor :children

  def initialize(v, p)
    @children = []
    super v, p
  end

  def to_s
    s = "value: #{@value} | children: ["
    if @children.size > 0
      @children[0] != nil ? s += "#{@children[0].value} " : s += '#, '
      @children[1] != nil ? s += "#{@children[1].value}" : s += '#'
    end
    s += ']'
    s
  end

  def is_leaf?
    false
  end

  def is_full?
    @children.size === 2 and @children[0] and @children[1]
  end

  def is_empty?
    @children.size == 0 or (not @children[0] and not @children[1])
  end

  def remove_child(node)
    if node.is_leaf? or node.is_empty?
      @children.delete(node)
    else
      index = @children.index(node)
      if not node.is_full? #only one descendant
        @children[index] = node.children[0] ? node.children[0] : node.children[1]
      else
        # two descendants; traverse left subtree
        largest = node.find_largest(node.children[0], node.children[0])
        @children[index].value = largest.value
        largest.parent.remove_child(largest)
      end
    end
  end

  def change_parent(new_parent)
    # get old parent
    old = @parent
    old_children_index = old.children.index(self)
    old[old_children_index]
  end

  def find_largest(node, largest)
    if node.is_leaf?
      largest
    else
      if node.is_empty?
        node.value > largest.value ? node : largest
      else
        left = node.children[0] ? find_largest(node.children[0], node.children[0].value > largest.value ? node.children[0] : largest) : largest
        right = node.children[1] ? find_largest(node.children[1], node.children[1].value > largest.value ? node.children[1] : largest) : largest
        right.value > left.value ? right : left
      end
    end
  end

  def where?(e)
    (e > value) ? @children[1] : @children[0]
  end

  def where_new?(e)
    if is_full?
      where? e
    else
      self
    end
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

  def to_s
    "value: #{@value}"
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
