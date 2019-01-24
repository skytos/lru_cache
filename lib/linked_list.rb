class LinkedList
  class LinkedListNode
    attr_accessor :data, :prev, :next
    def initialize(data, prev = nil, nxt = nil)
      @data = data
      @prev = prev
      @next = nxt
    end
  end

  include Enumerable

  attr_reader :front, :back
  def initialize
    @front = nil
    @back = nil
  end

  def each
    node = @front
    while node
      yield node.data
      node = node.next
    end
  end

  def push_back(data)
    node = LinkedListNode.new(data, @back, nil)
    @back.next = node if @back
    @back = node
    @front = node unless @front
    node
  end
  alias push push_back

  def push_front(data)
    node = LinkedListNode.new(data, nil, @front)
    @front.prev = node if @front
    @front = node
    @back = node unless @back
    node
  end

  # should probably save and check the list that node belongs to
  def delete_node(node)
    @front = node.next if node == @front
    @back = node.prev if node == @back
    node.prev.next = node.next if node.prev
    node.next.prev = node.prev if node.next
    nil
  end

  def delete_front
    raise IndexError.new('The list is empty') unless @front
    delete_node(@front)
  end

  # should probably save and check the list that node belongs to
  def move_back(node)
    delete_node(node)
    push_back(node.data)
  end
end
