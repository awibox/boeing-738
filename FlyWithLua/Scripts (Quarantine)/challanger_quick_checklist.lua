-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Script:  challanger quick checklist
-- Version: 1.0
-- Build:   06-01-2013
-- William Good
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Description:
-- Provide a script to using the cowl switch to set all checklist items to checked

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

require("xsaitekpanels")
if PLANE_ICAO == "CL30" then
-- we need define the DataRef
dataref("rembf1", "sim/custom/xap/rembf1", "writable")
dataref("rembf2", "sim/custom/xap/rembf2", "writable")
dataref("rembf3", "sim/custom/xap/rembf3", "writable")
dataref("rembf4", "sim/custom/xap/rembf4", "writable")
dataref("rembf5", "sim/custom/xap/rembf5", "writable")
dataref("rembf6", "sim/custom/xap/rembf6", "writable")
dataref("rembf7", "sim/custom/xap/rembf7", "writable")
dataref("rembf8", "sim/custom/xap/rembf8", "writable")
dataref("rembf9", "sim/custom/xap/rembf9", "writable")
dataref("rembf10", "sim/custom/xap/rembf10", "writable")
dataref("rembf11", "sim/custom/xap/rembf11", "writable")
dataref("rembf12", "sim/custom/xap/rembf12", "writable")
dataref("rembf13", "sim/custom/xap/rembf13", "writable")
dataref("rembf14", "sim/custom/xap/rembf14", "writable")

-- change button number to match what you are using
do_every_frame ([[
if SWITCH_COWL == 1 then
	rembf1 = 1
	rembf2 = 1
	rembf3 = 1
	rembf4 = 1
	rembf5 = 1
	rembf6 = 1
	rembf7 = 1
	rembf8 = 1
	rembf9 = 1
	rembf10 = 1
	rembf11 = 1
	rembf12 = 1
	rembf13 = 1
	rembf14 = 1
end
if SWITCH_COWL == 0 then
	rembf1 = 0
	rembf2 = 0
	rembf3 = 0
	rembf4 = 0
	rembf5 = 0
	rembf6 = 0
	rembf7 = 0
	rembf8 = 0
	rembf9 = 0
	rembf10 = 0
	rembf11 = 0
	rembf12 = 0
	rembf13 = 0
	rembf14 = 0
end]])
end
