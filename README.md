# lua-class
a class module for lua using similar syntax to other languages

## Getting Started
Require the module, call it, then assign it two variables, `class` and `new`.

```lua
local class, new = require("class")()
```

## Declaring Classes
To declare a class, you use the `class` function.

```lua
class "phone" {}
```

Data can be added to classes easily.

```lua
class "phone" {
    price = 500
}
```

## Creating Objects
You can create objects using the `new` function.

```lua
class "phone" {
    price = 500
}

local iphone = new "phone"
```

You can now access and modify the object without it affecting the original class.

```lua
class "phone" {
    price = 500
}

local iphone = new "phone"
iphone.price = 1000

print(iphone.price) -- output: 1000
```

## Class Constructors
Constructors are a special property of classes. They are a function which gets called whenever an object of the class is called. You can assign arguments to them which will be assigned when an object of the class is called.<br/>
**The self keyword can be used inside of the constructor ~~as well as every other function in the class to access the current object.~~** ( i forgot to add it to every function, will be added very soon. )

```lua
class "phone" {
    price = 500,
    constructor = function(starting_price)
        self.price = starting_price
    end
}

local iphone = new "phone"(1000) -- calls constructor function with given arguments
print(iphone.price) -- output: 1000
```
