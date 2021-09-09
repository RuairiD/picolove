local api = require("api")
log = print

-- test picolove api

do -- test api.min
	assert(api.min(1, 2) == 1)
	assert(api.min(2, 1) == 1)
	assert(api.min(-1, 2) == -1)
	assert(api.min(2, -1) == -1)

	assert(api.min("1", "2") == 1)
	assert(api.min("2", "1") == 1)
	assert(api.min("-1", "2") == -1)
	assert(api.min("2", "-1") == -1)

	assert(api.min(1, nil) == 0)
	assert(api.min(nil, 1) == 0)
	assert(api.min(-1, nil) == -1)
	assert(api.min(nil, -1) == -1)

	assert(api.min(1, "X") == 0)
	assert(api.min("X", 1) == 0)
	assert(api.min(-1, "X") == -1)
	assert(api.min("X", -1) == -1)

	assert(api.min(nil, nil) == 0)
end


do -- test api.max
	assert(api.min(1, 2) == 1)
	assert(api.max(1, 2) == 2)
	assert(api.max(2, 1) == 2)
	assert(api.max(-1, 2) == 2)
	assert(api.max(2, -1) == 2)

	assert(api.max("1", "2") == 2)
	assert(api.max("2", "1") == 2)
	assert(api.max("-1", "2") == 2)
	assert(api.max("2", "-1") == 2)

	assert(api.max(1, nil) == 1)
	assert(api.max(nil, 1) == 1)
	assert(api.max(-1, nil) == 0)
	assert(api.max(nil, -1) == 0)

	assert(api.max(1, "X") == 1)
	assert(api.max("X", 1) == 1)
	assert(api.max(-1, "X") == 0)
	assert(api.max("X", -1) == 0)

	assert(api.max(nil, nil) == 0)
end


do -- test api.mid
	assert(api.mid(1, 2, 3) == 2)
	assert(api.mid(1, 3, 2) == 2)
	assert(api.mid(2, 1, 3) == 2)
	assert(api.mid(2, 3, 1) == 2)
	assert(api.mid(3, 1, 2) == 2)
	assert(api.mid(3, 2, 1) == 2)
end


do -- test api.atan2
	assert(api.atan2(1, 0) == 0)
	assert(api.atan2(0, -1) == 0.25)
	assert(api.atan2(-1, 0) == 0.5)
	assert(api.atan2(0, 1) == 0.75)
end


do -- test api.band
	assert(bit.band(0x01, bit.lshift(1, 0)) ~= 0)
	assert(bit.band(0x02, bit.lshift(1, 1)) ~= 0)
	assert(bit.band(0x04, bit.lshift(1, 2)) ~= 0)

	assert(bit.band(0x05, bit.lshift(1, 2)) ~= 0)
	assert(bit.band(0x05, bit.lshift(1, 0)) ~= 0)
	assert(bit.band(0x05, bit.lshift(1, 3)) == 0)
end


do -- test api.all
	local iter = api.all({nil, nil, 11, nil, 22, 33, 33, b = 42, 44})
	assert(iter() == 11)
	assert(iter() == 22)
	assert(iter() == 33)
	assert(iter() == 33)
	assert(iter() == 44)
	assert(iter() == nil)
end


do -- test api.add
	local array = {}
	assert(api.add(nil, 1) == nil)
	assert(api.add(array, 1) == 1)
	assert(api.add(array, 2) == 2)
	assert(api.add(array, 3) == 3)
	assert(api.add(array, 1) == 1)
	assert(api.add(array, 2) == 2)
	assert(api.add(array, 3) == 3)
	assert(array[1] == 1)
	assert(array[2] == 2)
	assert(array[3] == 3)
	assert(array[4] == 1)
	assert(array[5] == 2)
	assert(array[6] == 3)
	assert(array[7] == nil)
end


do -- test api.del
	local array2 = {1, 2, 3, 1, 2, 3}
	assert(array2[1] == 1)
	assert(array2[2] == 2)
	assert(array2[3] == 3)
	assert(array2[4] == 1)
	assert(array2[5] == 2)
	assert(array2[6] == 3)
	assert(array2[7] == nil)
	assert(api.del(array2, 1) == 1)
	assert(array2[1] == 2)
	assert(array2[2] == 3)
	assert(array2[3] == 1)
	assert(array2[4] == 2)
	assert(array2[5] == 3)
	assert(array2[6] == nil)
	assert(api.del(array2, 3) == 3)
	assert(array2[1] == 2)
	assert(array2[2] == 1)
	assert(array2[3] == 2)
	assert(array2[4] == 3)
	assert(array2[5] == nil)
	assert(api.del(array2, 3) == 3)
	assert(array2[1] == 2)
	assert(array2[2] == 1)
	assert(array2[3] == 2)
	assert(array2[4] == nil)
	assert(api.del(array2, 3) == nil)
	assert(array2[1] == 2)
	assert(array2[2] == 1)
	assert(array2[3] == 2)
	assert(array2[4] == nil)
end


do -- test api.tostr
	assert(api.tostr() == "")
	assert(api.tostr("") == "")
	assert(api.tostr(nil) == "[nil]")
	assert(api.tostr(nil, nil) == "[nil]")
	assert(api.tostr(true) == "true")
	assert(api.tostr(false) == "false")
	assert(api.tostr("test") == "test")
	assert(api.tostr({nil}) == "[table]")
	assert(api.tostr(1) == "1")
	assert(api.tostr(255) == "255")
	assert(api.tostr(255, nil) == "255")
	assert(api.tostr(255, 0) == "255")
	assert(api.tostr(255, 1) == "0x00ff.0000")
	assert(api.tostr(255, true) == "0x00ff.0000")
	assert(api.tostr(255, 2) == "16711680")
	assert(api.tostr(255, 3) == "0x00ff0000")
	assert(api.tostr(255, 4) == "255")
	assert(api.tostr(255, 5) == "0x00ff.0000")
	assert(api.tostr(255, 6) == "16711680")
	assert(api.tostr(255, 7) == "0x00ff0000")
end
