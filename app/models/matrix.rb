class Matrix < User
 
  def initialize(user = nil)
    sponsore = User.find_by(refferal_id: user.sponsor_id)
    @sponsore = sponsore unless sponsore.nil?
    @new_user = user
    search_and_insert_node(@sponsore, @new_user)
  end

  # def search(value)
  #   return nil if @root_node.nil?
  #   return search_at_node(@root_node, value)
  # end

  # def search_at_node(tree_node, value)
  #   return nil if tree_node.nil?
  #   return tree_node if value == tree_node.value
  #   return search_at_node(tree_node.left_node, value) if value < tree_node.value
  #   return search_at_node(tree_node.right_node, value)
  # end

  # def insert(value)
  #   # new_node = BSTNode.new(value, nil, nil)
  #   # @root_node = new_node and return if @root_node.nil? #if root_node is nil make new_node root_node
  #   # insert_at_node(@root_node, new_node)
  # end

  def insert_at_node(tree_node, new_node)
    raise "Are you trying to register your self?" if tree_node == new_node
    if tree_node.is_childless?
      return tree_node.children.create(new_node)
    elsif tree_node.children == 1
      return tree_node.first_downlines.siblings.create(new_node)
    else
      raise "Not understanding the flow" 
    end 
  end

  # def traverse(&block)
  #   traverse_at_node(@root_node, &block)
  # end

  # def traverse_at_node(node, &block)
  #   return if node.nil?
  #   traverse_at_node(node.left_node, &block)
  #   yield node.value if block_given?
  #   traverse_at_node(node.right_node, &block)
  # end
  
  def search_and_insert_node(sponsore, new_user) 
    insert_at_node(found_node, new_node)  
  end
end
