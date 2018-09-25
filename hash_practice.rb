class HashClass

  def initialize(size)
    @array = Array.new(size) { [] }
  end
  
  def []=(key, value)
    slot_number = index(key, @array.length)
    dynamic_array = @array[slot_number]
    kv_pair = dynamic_array.find { |pair| 
      pair[0] == key
    }
    if kv_pair
      kv_pair[1] = value
    else
      @array[slot_number] << [key, value]
    end
    
  end

  def [](key)
    slot_number = index(key, @array.length)
    dynamic_array = @array[slot_number]
    kv_pair = dynamic_array.find { |pair| 
      pair[0] == key
    }
    kv_pair[1] if kv_pair
  end

  def size
    # count = @array.length
    # @array.each do |dynamic_array|
    #   count += (dynamic_array.length)
    # end   
    # return count
    @array.flatten(2).size
  end

  # private
  def index(key, size)
    key.to_s.chars.inject(0) { |sum, ch| sum + ch.ord } % @array.length
  end

  def resize
    old_array = @array
    @array = Array.new(old_array.length * 2) { [] }
    # @count = 0
    old_array.each do |dynamic_array|
      dynamic_array.each do |key, value|
        self[key] = value
      end
    end
  end
end


movies = HashClass.new(10)
# movies["key"] = "value"
# movies["key"] = "different"
# p movies
# movies["key"] = "different"
# p movies
# p movies.size
movies["The Lord of the Rings: The Fellowship of the Ring"] = "3 hours, 48 minutes"
movies["The Lord of the Rings: The Return of the King"] = "3 hours, 21 minutes"
# movies["A New Hope"] = "Average"
# movies["Empire Strikes Back"] = "Excellent"
# movies["Return of the Jedi"] = "The Best"
p movies
movies.resize
p movies.size
p movies["The Lord of the Rings: The Fellowship of the Ring"]
p movies["The Lord of the Rings: The Return of the King"]

# p movies["Empire Strikes Back"]
# p movies
# movies["A New Hope"] = "Average"
# movies["Empire Strikes Back"] = "Excellent"
# movies["Return of the Jedi"] = "The Best"
# p movies["A New Hope"]
# movies["foo"] = "baz"
# p movies

hash = HashClass.new(1)
hash["key"] = "value"
p hash.size
hash["key"] = "different"
p hash.size
p hash


