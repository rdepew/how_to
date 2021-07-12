# Key-value pairs in Lua

## The first thing I learned

I've been trying to figure out how to see the keys as well as the values 
in Lua arrays. I don't know why they make it so difficult to find out.

I finally found it. In 
  https://www.tutorialspoint.com/lua/lua_iterators.htm ,
there's this little snippet:

```lua
array = {"Lua", "Tutorial"}

for key,value in ipairs(array) 
do
   print(key, value)
end
```

which creates this output:

```
1  Lua
2  Tutorial
```

Reread this page several times and get very familiar with iterators. They
may be the key to decoding my JSON files.


## The second thing I learned

pairs() and ipairs() work a little differently.

Basically, if a table only has numeric keys (indexes from 1 to #table), use
ipairs(), because ipairs() only uses numeric keys. If a table has some keys
that are hashes (that means "not numeric"), then use pairs(), because
pairs() iterates over all elements in the table.

I defined a table t, and then used it to show the difference between pairs
and ipairs.
```lua
> t = { fred='one', [0]=1; 10, 20, 30, 40 }
> for i,v in ipairs(t) do print(i,v) end
1       10
2       20
3       30
4       40
> for i,v in pairs(t) do print(i,v) end
1       10
2       20
3       30
4       40
0       1
fred    one
```
Note 1: Comma and semicolon are equally good as separators in a table.
Note 2: With pairs() there's no specified order for traversal. ipairs()
 always gos t[1], t[2], etc., stopping at the first nil value.

You can also iterate over all elements of a table using a for loop:
```lua
for i = 1, #table do
    print( i, ".", #table )
done
```
NOTE: This may only work for strictly-numeric tables. Not sure.

Using numeric indexes is called "index syntax". Using hash (non-numeric)
indexes is called "declaration syntax". Declaration syntax is what makes
Lua modules so powerful:
```lua
blah = {}

blah.constant1 = 3.14
blah.constant2 = 1.414
local blah.variable1 = 3
local blah.function1()
    -- do stuff
end

return blah
```

## The third thing that I learned

Some critically important information about tables: 
https://riptutorial.com/lua/topic/676/tables

"A Lua table with consecutive positive integer keys beginning with 1 is said to
have a sequence. The key-value pairs with positive integer keys are the
elements of the sequence. Other languages call this a 1-based array. Certain
standard operations and functions only work on the sequence of a table and some
have non-deterministic behavior when applied to a table without a sequence.

Setting a value in a table to nil removes it from the table. Iterators would no
longer see the related key. When coding for a table with a sequence, it is
important to avoid breaking the sequence; Only remove the last element or use a
function, like the standard table.remove, that shifts elements down to close
the gap."

An *array* is a table used as a sequence -- that is, a group of items keyed
by integers, like this:
```lua
local pets = { "dogs", "cats", "birds" }
```
ipairs() works on this table.


## The fourth thing that I learned

This is an example of a "sparse array" -- an array that has holes in it.
```lua
local pets = { "dogs", "cats", "birds" }
pets[12] = "goldfish"
```
because now the array looks like this:

{"dogs", "cats", "birds", nil, nil, nil, nil, nil, nil, nil, nil, "goldfish"}
-- 1        2       3      4    5    6    7    8    9    10   11       12 

The # length operator stops at the first nil value, so #pets is 3.
The ipairs() function stops at the first nil value, so it misses "goldfish"
entirely.
table.unpack() also stops at the first nil value. Waitaminnit, Corona
doesn't list pack() or unpack() in the table API.


## Tables as records

Tables can also use "record-style syntax":
```lua
local conf_table = {
    hostname = "localhost",
    port     = 22,
    flags    = "-Wall -Wextra"
    clients  = {                -- nested table
        "Eve", "Jim", "Peter"
    }
}
```

All of this is just syntactic sugar for what's really going on:
```lua
local conf_table = {
    ["hostname"] = "localhost",
    ["port"]     = 22,
    ["flags"]    = "-Wall -Wextra"
    ["clients"]  = {                -- nested table
        [1] = "Eve", [2] = "Jim", [3] = "Peter"
    }
}
```

