# Ruby Tutorial

## Syntax

=, ==, <, >, !=, &&, ||, (and, or)
+=, -=, ||=, &&=

Commands need to be on separate lines or divided with `;`
`gets`,`puts` and `print` commands interact with the user

```ruby
gets a
puts a; print a
```

## Variables

Most of the things in ruby are objects, but not variables.
However variables are pointers.

```ruby
var1 = "Hello"    # A String object will be created with the value "Hello" and var1 will point to it
var1 = "World!"   # Another object will be created and var1 will point to it
var1 = var2       # Both vars will point to the same memory address
var1 = var2.clone # Vars will have the same value but different addresses
```

### Mutability

Numbers and boolean and nil are immutable. This means any operation done on this objects will actually create another with the result.

```ruby
var1 = 2  # var1.object_id => 5
var1 += 1 # var1.object_id => 7
var1 = 4  # var1.object_id => 9
var2 = 4  # var2.object_id => 9
```

However most of object in Ruby are mutable.

```ruby
var1 = "peter"  # var1.object_id => 70323882699880
var1.upcase!    # var1 => PETER; var1.object_id => 70323882699880
var2 = "PETER"  # var2.object_id => 70255196520900
```

## Functions

Functions are defined with `def` and `end` key words.
Ruby tries to evaluate everything. So return clause is not used.

```ruby
def hw
  "Hello World!"
end

puts hw
```

### Passing arguments

Arguments are passed by reference. In the case below var1 and var2 will point to the same memory address, so var1 will become uppercase.

```ruby
var1 = "peter"  # var1.object_id => 70323882699880
def fun1 (var2)
  var2.upcase!
  var2.object_id
end  
fun1(var1)
puts var1
```

## Classes

Classes are declared with `class` reserved word.

In order to avoid set, get methods and constructors you can set the access to class attributes with `attr_reader`, `attr_writer` or `attr_accessor`. You can however declare them if you want to. Constructor method is called `initialize`. The attributes are referenced inside the class with `@` sign.

Using the attr prefixes way.

```ruby
class Cartoon1
  attr_accessor :name, :surname
end

var1 = Cartoon1.new; var1.name = "Peter"; var1.surname = "Rabbit"
var2 = var1:name
```

Using the old school way.

```ruby
class Cartoon2
  def initialize (name, surname); @name = name; @surname=surname; end
  def get_name; @name; end
  def get_surname; @surname; end
end

var1 = Cartoon2.new("Peter", "Rabbit")
var2 = var1.get_name
```

The above example has `Cartoon1` and `Cartoon2` because of `Open Classes` concept in Ruby.
So if I had used the same name I would end up with a single class.
You can override methods this way and you can even alter default functionality.

```ruby
puts "Peter".size
class String
  def size; 10000; end
end
puts "Peter".size
```

### Inheritance

Simple inheritance is allowed but not multiple inheritance.
`<` is the symbol for inheritance.

You can have `private` and `protected` methods and attributes but `public` is the default and also mostly used.

Static methods (class methods) are defined with `self` keyword.
Static attributes (class attributes) are marked by `@@`.

Static attributes are shared between inherit classes. However instance attributes used in static methods are not. Which is most likely something that you will use 99 percent of the time.

```ruby
class Mouse
  @@blink = 2; @clap = 2
  def self.blink; @@blink end
  def self.clap; @clap end
end
class Pinky < Mouse; @@blink = 4; @clap = 4 end
class Brain < Mouse; @@blink = 1; @clap = 0 end

puts Pinky.blink, Pinky.clap
```

## Flow

Only false and nil evaluate to false.
Everything else is tue such as: true, 1, 0, empty string, etc.

### If, unless and ternary statements

`then` is optional in an `if` clause.
`if` has a short version.
`if` will evaluate and return a value.
`elsif` can be used as part of if statement.

```ruby
mess = if var>10; "Greater than" else "Less or equal" end
mess = if var>10 then "Greater than" elsif var==10 then "Equal" else "Less or equal" end
mess = "Greater than" if var>10
mess = var>10 ? "Greater than" : "Less or equal" # Ternary operator `?`
```

`unless` is the counterpart of `if`. if not condition is equivalent to unless condition.
`unless` has also a short version

```ruby
mess = unless var>10; "Less or equal" else "Greater than" end
mess = "Less or equal" unless var>10
```

### Case statement

for `case` statement `then` is optional

```ruby
case var
  when 1 then "one"
  when 2 then "two"
else "more than 2"
end
```

### Loops

`do` is optional for `while` and `until` loops.
Both `while` and `until` loops have a short version.

```ruby
while var<=10 do puts var; var+=1 end       # one line while loop
(puts var; var+=1;) while var<=10           # short version while loop

until var==11 do puts var; var+=1 end       # one line while loop
(puts var; var+=1;) until var==11           # short version while loop
```

Both `while` and `until` loops have begin end variations. These will execute at least once
even if the condition is false, as opposed to the short version.

```ruby
begin puts var; var+=1 end while var<=10
begin puts var; var+=1 end until var==11
```

`for` and `each` loops has also `do` as optional.

```ruby
for i in [3,2,1] do puts i end      # Iterate over collection
for i in (1..10) do puts i end      # Iterate over range
[3,2,1].each do |var| puts var end  # Iterate over collection
(1..10).each { |var| puts var }     # Iterate over range
```

Lopping using Integer methods.

```ruby
1.upto(5) { |var| puts var }      # 1 2 3 4 5
5.downto(1) { |var| puts var }    # 5 4 3 2 1
3.times { puts "var" }            # var var var
1.step(10,2) { |var| puts var }   # 1 3 5 7 9
```

Infinite loop can be achieved with command `loop`.
`break`, `next` and `redo` can control the flow for all loops.

```ruby
loop do puts var; var+=1; var>5 ? break : next end    # next is not necessary
loop do puts var; var+=1; var>5 ? break : redo end    # redo is not necessary
```

## Exception handling

Exception handling is introduced with `rescue`.

```ruby
begin
...
rescue StandardError =>e
  puts e.message
  puts e.backtrace
  false
end
```

## Strings

Array of chars.

```ruby
"Nick"[1]      # => i, retrieve char from position 1
"Nick"[1,3]    # => ick, from position 1  retrieve 3 chars
"Nick"["ck"]   # => ck, substring exists
"Nick"["La"]   # => nil, substring does not exist
"ha "*3        # => ha ha ha
```