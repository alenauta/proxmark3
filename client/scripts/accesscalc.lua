local getopt = require('getopt')
local math = require('math')
local conv = require('bindechex')
example = "script run accesscalc -x 08778F"
author = "Nauta"


desc =
[[
Use this script t calculate access bits for a sector

syntax: accesscalc -x <access bytes hex>

Arguments:
	-x <access bytes hex>	
	-d 			debug logging on
	-h 			this help

]]

-------------------------------
-- Some utilities 
-------------------------------
local DEBUG = false
--- 
-- A debug printout-function
function dbg(args)
	if DEBUG then
		print("###", args)
	end
end 
--- 
-- This is only meant to be used when errors occur
function oops(err)
	print("ERROR: ",err)
	return nil,err
end

--- 
-- Usage help
function help()
	print(desc)
	print("Example usage")
	print(example)
end

--- 
-- The main entry point
function main(args)

	local bytes

	-- Read the parameters
	for o, a in getopt.getopt(args, 'x:hd') do
		if o == "x" then bytes = a end
		if o == "h" then help() return end
		if o == "d" then DEBUG = true end
	end


	dbg(bytes)

	local b1 = string.sub(bytes,1,2)
	local b2 = string.sub(bytes,3,4)
	local b3 = string.sub(bytes,5,6)

	dbg(b1)
	dbg(b2)
	dbg(b3)

	local bin2 = string.sub(conv.Hex2Bin(b2),1,4)
	local bin3 = conv.Hex2Bin(b3)

	dbg(bin2)
	dbg(bin3)

	local blk0 = string.sub(bin2,4,4).." "..string.sub(bin3,8,8).." "..string.sub(bin3,4,4)
	local blk1 = string.sub(bin2,3,3).." "..string.sub(bin3,7,7).." "..string.sub(bin3,3,3)
	local blk2 = string.sub(bin2,2,2).." "..string.sub(bin3,6,6).." "..string.sub(bin3,2,2)
	local blk3 = string.sub(bin2,1,1).." "..string.sub(bin3,5,5).." "..string.sub(bin3,1,1)

	dbg(blk0)
	dbg(blk1)
	dbg(blk2)
	dbg(blk3)

	print("Block0: "..blk0)
	print("Block1: "..blk1)
	print("Block2: "..blk2)
	print("Block3: "..blk3)



end


-- Call the main 
main(args)

