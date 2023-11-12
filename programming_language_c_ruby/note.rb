# Ruby is a dynamically typed language OOP language

# 1. Example of definining a class
class A
    def m1
        34
    end
    def m2 (x,y)
        z = 7
        if x > y
            false
        else
            x + y * z
        end
    end
end

# 2. Object state -  theses are variables that are part of an object instance. It is private to the object. Only the object methods 
# can access the variables - use @variable_name to create variable
class B
    # class constanct
    HardName = "Ola"

    # initialize is just like constructror in javascript
    def initialize (f)
        @foo = f
        # class variable
        @age=2
        @@info = "welcome"
    end
    def m1
        @foo = "Kayode"
    end
    def m2 x
        @foo += x
    end
    def foo
        @foo
    end
    def change (x)
        @@info = x
    end
    def info
        @@info
    end
    def age= x
        @age += x
    end 
end


# 3. Visibility - ruby class variables are private and can only be private
# but the methods can either be private, protected and public. It is usually
# public by default
# private - only available to the object itself
# protected - available to only code in the class or subclass
# public - available to all code
class C
    protected
    def sing
        "I am singing unto the lord"
    end
    private
    def sing_again
        "Singing hallelujah"
    end
    public
    def sing_louder
        "Songs end"
    end
end

# 4. Arrays - it's pretty similar to Python's list
arr = [1, 3, "welcome", true] 
x = if arr[0] > arr[1] then 10 else 20 end
y = Array.new(x)

# push to the top of a stack
arr.push 3
# pop to top of the stack
arr.pop

# it also has shift and unshift
# arr.each { |1| puts (i*i) }

# 5. Blocks. Blocks are closure in the sense that they can refer the the
# variables in scope where the block is defined. For example, after this program
# executes, y is bound to 10
y = 7
[4, 5, 6].each { y += 1} # y is now 10


# In rare occasions, you may need to create block for your method
def foo x
    if x
        yield
    else
        yield
        yield
    end
end

foo (true) { puts "hi" } # hi once
foo (false) { puts "hi" } # hi twice

# To pass an argument to a yield, you do that like you would a function
def sing x
    if x
        yield 10
    else 
        yield 20
    end
end

sing (true) {|z| puts z}
sing (false) {|z| puts z}

def count i
    if yield i
        1
    else 
        1 + (count (i+1) {|x| yield x})
    end
end

# yield acts like a caller to the block and it can be call 
# several times in a method
def silly_example x
    (yield x) + (yield 23)
end

res = silly_example(5) { |x| x += 2}
print(res);print("\n")

class Foo
    def initialize(max)
        @max = max
    end
    def silly
        yield(4, 5) + yield(@max, @max)
    end
    def count base
        if base > @max
            raised "reach max"
        elsif yield base
            1
        else
            1 + (count(base + 1) {|i| yield i})
        end
    end
end

# Hashes is pretty similar to records in python
h1 = {} # or
h1 = Hash.new

h1["name"] = "Oluwasegun Kayode"
puts h1

# Creating hash from scratch
h2 = {
  "name" => "Segun Kayode",
  "age" => 34  
}
puts h2

h2.each {|k,v| puts k.to_s + v.to_s}

# Range are like array but rather than store a long list of items, 
# they are objects that store the upper bound and lower bound of a range. 
r = 1...100

# you can treat them like arrays and call methonds on the. eg
summ = r.inject(0) {|acc, v| acc + v }
puts summ

## Subclassing - basically inheritance. Every Class in Ruby is defaultly extending
# the object class - For example

# point system on a 2d plane
class Point
    attr_accessor :x, :y # defines methods x, y, x=, y=
    
    def initialize(x, y)
        @x = x
        @y = y
    end

    def distFromOrigin
        Math.sqrt(@x * @x + @y * @y) # use instance variables
    end

    def distFromOrigin2
        Math.sqrt(x * x + y * y) # use getter methods
    end
end

class ColorPoint < Point
    attr_accessor :color

    def initialize(x, y, c="clear")
        super(x, y)
        @color = c
    end
end


