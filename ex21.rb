def add(a, b)
  return a + b
end

def subtract(a, b)
  return a - b
end

def multiply(a, b)
  return a * b
end

def divide(a, b)
  return a / b
end

age = add(30, 5)
height = subtract(78, 4)
weight = multiply(85, 2)
iq = divide(100, 2)

puts "Age: #{age}, Height: #{height}, Weight: #{weight}, IQ: #{iq}"

what = add(age, subtract(height, multiply(weight, divide(iq, 2))))

puts what
