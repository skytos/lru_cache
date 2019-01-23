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
    nil
  end

  def push_front(data)
    node = LinkedListNode.new(data, nil, @front)
    @front.prev = node if @front
    @front = node
    @back = node unless @back
    nil
  end
end
