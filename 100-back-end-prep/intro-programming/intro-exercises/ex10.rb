# yes you can have hash values that are arrays and arrays of hashes

hsh = { key: ["arr_val1", "arr_val2"], key2: ["more array"] }
arr = [{ key: "value", key2: "value2" }, 2, 3 ]

p hsh
p arr
