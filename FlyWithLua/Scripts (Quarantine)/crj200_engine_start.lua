-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Script:  CRJ 200 engine start
-- Version: 1.0
-- Build:   06-25-2013
-- William Good
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Description:
-- Provide a script to help in starting engines
-- I am using my Saitek Pro Flight Throttle, Prop and Mixture System
-- I am using the swithes to expand what I have control over.
-- G1 Left Red cutoff switch G2 Right Red cutoff switch
-- G3 APU fuel and start G6 APU generator
-- G4 Hydraulic pumps 1, 2, 3A, 3B

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

require("xsaitekpanels")
if PLANE_ICAO == "CRJ2" then
-- we need define the DataRef
dataref("Leftred1", "CRJ/eng/red1_switch", "writable")
dataref("Rightred2", "CRJ/eng/red2_switch", "writable")
dataref("ApuFuel", "CRJ/apu/apu_fuel_button_click", "writable")
dataref("ApuStart", "CRJ/apu/apu_start_button_click", "writable")
dataref("ApuBleed", "CRJ/bleed/apu_button", "writable")
dataref("ApuGen", "CRJ/elec/apu_gen_sw", "writable")
dataref("Hydraulic1", "CRJ/hyd/hyd_1_sw", "writable")
dataref("Hydraulic2", "CRJ/hyd/hyd_2_sw", "writable")
dataref("Hydraulic3A", "CRJ/hyd/hyd_3a_sw", "writable")
dataref("Hydraulic3B", "CRJ/hyd/hyd_3b_sw", "writable")

-- change button number to match what your button numbers
do_every_frame ([[
if not button(480) and last_button(480) then
	Leftred1 = 1
end

if button(480) and last_button(480) then
	Leftred1 = 0
end

if not button(481) and last_button(481) then
	Rightred2 = 1
end

if button(481) and last_button(481) then
	Rightred2 = 0

end]])

do_every_frame ([[
if not button(482) and last_button(482) then
	ApuFuel = 1
	ApuStart = 1
	ApuBleed = 1
end

if button(482) and last_button(482) then
	ApuFuel = 0
	ApuStart = 0
	ApuBleed = 0
end]])

do_every_frame ([[
if not button(485) and last_button(485) then
	ApuGen = 1
	
end

if button(485) and last_button(485) then
	ApuGen = 0
	
end]])

do_every_frame ([[
if not button(483) and last_button(483) then
	Hydraulic1 = 1
	Hydraulic2 = 1
	Hydraulic3A = 1
	Hydraulic3B = 1	
end

if button(483) and last_button(483) then
	Hydraulic1 = 0
	Hydraulic2 = 0
	Hydraulic3A = 0
	Hydraulic3B = 0
	
end]])

end
