class LinkedList
  class Node
    attr_accessor :data, :prev, :next
    def init(data, prev = nil, nxt = nil)
      @data = data
      @prev = prev
      @next = nxt
    end
  end

  include Enumerable

  def init
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
    node = Node.new(data, @back, nil)
    @back.next = node if @back
    @back = node
    @front = node unless @front
    nil
  end

  def push_front(data)
    node = Node.new(data, nil, @front)
    @front.prev = node if @front
    @front = node
    @back = node unless @back
    nil
  end
end
