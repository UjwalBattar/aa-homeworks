class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end

end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift
  end

  def deque
    @queue.pop
  end

  def show
    @Queue
  end

end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.lookup(key) == []
      @map << [key, value]
    else
      @map.remove(key)
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.select {|pair| key == pair[0]}
  end

  def remove(key)
    @map.delete {|pair| key == pair[0]}
  end

end
