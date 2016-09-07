local getopt = require('getopt')
local math = require('math')
example = "script run insertcoin -t B -k c048bdae7e8d -a 500"
author = "Nauta"


desc =
[[
Use this script top up your coffe card ;) 

syntax: insertcoin -t <key type> -k <key> -a <amount in cent>

Arguments:
	-d 				debug logging on
	-h 				this help

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


	local verbose = false
	local key
	local keyt
	local euro
	-- Read the parameters
	for o, a in getopt.getopt(args, 't:k:a:hd') do
		if o == "t" then keyt = a end
		if o == "k" then key = a end
		if o == "a" then euro = a end
		if o == "h" then help() return end
		if o == "d" then DEBUG = true end
	end

	--local key = "c048bdae7e8d"
	--local keyt = "B"
	--local euro = 500
	dbg(euro)

	block = to_block(string.format("%08x",euro))
	dbg(block)

	local cmd = "hf mf wrbl 8 "..keyt.." "..key.." "..block
	dbg(cmd)
	core.console(cmd)

end

function to_block(eurohex)
	dbg(eurohex)
	local n1 = string.sub(eurohex,7,8)
	local n2 = string.sub(eurohex,5,6)
	local n3 = string.sub(eurohex,3,4)
	local n4 = string.sub(eurohex,1,2)
	dbg(n1)
	dbg(n2)
	dbg(n3)
	dbg(n4)
	local t1 = string.format("%02x",tonumber("FF",16) - tonumber(n1,16))
	dbg(t1)
	local t2 = string.format("%02x",tonumber("FF",16) - tonumber(n2,16))
	dbg(t2)
	local t3 = string.format("%02x",tonumber("FF",16) - tonumber(n3,16))
	dbg(t3)
	local t4 = string.format("%02x",tonumber("FF",16) - tonumber(n4,16))
	dbg(t4)

	local block = n1..n2..n3..n4..t1..t2..t3..t4..n1..n2..n3..n4.."09f609f6"
	return block
	
end

-- Call the main 
main(args)

