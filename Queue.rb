class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
      @store << element
      #option 2: @store.unshift(element) <--- puts element in the first position of an array
  end

  def dequeue
    @store.shift #removes the first element in the array
    #option 2: return @store.pop
  end

  def front
    return @store.first
    #option 2: return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0
  end
end
