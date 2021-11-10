-- localize globals

local assert = assert;
local type = type;
local setmetatable = setmetatable;
local getfenv = getfenv;

-- create class functions

local classes = {}

local function class(class_name)
    assert(type(class_name) == "string", "Expected type string for class name, got " .. type(class_name))

    return function(class_data)
        classes[class_name] = class_data
    end
end

local function new(class_name)
    local class = classes[class_name]
    assert(class, class_name .. " is not a valid class name")

    local object = setmetatable({}, {
        __index = class,
        __call = function(self, ...)
            if (self.constructor) then
                return self.constructor(...)
            end
        end
    })

    local constructor = object.constructor
    if (constructor) then
        assert(type(constructor) == "function", "Expected type function for constructor, got " .. type(constructor))

        object.constructor = function(...)
            getfenv()["self"] = object

            constructor(...)

            return object
        end
    end

    return object
end

return function()
    return class, new
end
