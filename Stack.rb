class Stack
  def initialize
    @store = Array.new #<--- underlying structure for the stack
  end

  def push(element)
    @store << element #@store.push(element)
  end

  def pop
      return @store.pop
  end

  def top
    return @store.last
  end

  def size
    return @store.length
  end

  def empty?
    return size == 0 #calls the method size from before 
    #@store.empty? #@store.length == 0
  end
end
