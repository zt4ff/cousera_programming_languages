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

# 4. A longer example
class MyRational

    def initialize(num,den=1)
        if den == 0
            raise "MyRational received an inappropiate argument"
        elsif den < 0
            @num = - num
            @den = - den
        else
            @num = num
            @den = den
        end
        reduce # i.e self.reduce but reducte is private
    end

    def to_ _s
        ans = @num.to__s
        if @den != 1
            ans += "/"
            ans += @den.to__s
        end
        ans
    end
end
