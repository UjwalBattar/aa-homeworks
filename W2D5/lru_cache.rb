class LRUCache
  attr_reader :cache
    def initialize(n=0)
      @cache = Array.new(n)
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.length == n
        @cache.shift
        @cache.push(el)
      else
        @cache.push(el)
      end
      @cache
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!

  end
