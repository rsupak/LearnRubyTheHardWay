class HashClass

  def initialize(size)
    @array = Array.new(size)
  end
  
  def []=(key, value)
    bucket = index(key, size)
    p bucket
    if @array[bucket] != nil
      if @array[bucket] != value
        resize
        bucket += 1
      else
        @array[bucket] = value
      end
    end
    @array[bucket] = value
  end

  def [](key)
    bucket = index(key, size)
    @array[bucket]
  end

  def size
    @array.length
  end

  def index(key, size)
    key.to_s.chars.map(&:ord).reduce(:+) % size
  end

  def resize
    old_array = @array
    @array = Array.new(size * 2)
    old_array.each_with_index do |item, index|
      @array[index] = item
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
