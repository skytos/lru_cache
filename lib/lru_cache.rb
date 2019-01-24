require 'linked_list'

class LRUCache
  attr_reader :max_size, :size
  def initialize(max_size)
    @max_size = max_size
    @size = 0
    @cache = {} #key => value
    @nodes = {} # key => LinkedListNode
    @keys = LinkedList.new
  end

  def set(key, val)
    @size += 1 unless @cache.has_key?(key)
    update(key)
    @cache[key] = val
  end

  def get(key)
    update(key) if @cache.has_key?(key)
    @cache[key]
  end

  def update(key)
    if @nodes.has_key?(key)
      node = @keys.move_back(@nodes[key])
      @nodes[key] = node
    else
      node = @keys.push(key)
      @nodes[key] = node
    end
  end

  def keys
    @keys.to_a
  end
end
