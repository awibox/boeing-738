-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Script:  Hadware tester for Saitek Switch Panel
-- Version: 1.0
-- Build:   06-04-2013
-- William Good
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Description:
-- Provide a script to test the Saitek Switch Panel Hardware

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

require("xsaitekpanels")
require("graphics")

test_switchpanel_is_on = true

function test_switchpanel_hardware()

	if not test_switchpanel_is_on then return end

	draw_string(20, 125, "Switch Panel Harware Tester", "green")

	if SWITCH_STARTOFF == 1 then
		draw_string(5, 100, "OFF", "green")
	end
	if SWITCH_STARTOFF == 0 then
		draw_string(5, 100, "OFF", "red")
	end

	if SWITCH_STARTRIGHT == 1 then
		draw_string(5, 80, "RIGHT", "green")
	end
	if SWITCH_STARTRIGHT == 0 then
		draw_string(5, 80, "RIGHT", "red")
	end

	if SWITCH_STARTLEFT == 1 then
		draw_string(5, 60, "LEFT", "green")
	end
	if SWITCH_STARTLEFT == 0 then
		draw_string(5, 60, "LEFT", "red")
	end

	if SWITCH_STARTBOTH == 1 then
		draw_string(5, 40, "BOTH", "green")
	end
	if SWITCH_STARTBOTH == 0 then
		draw_string(5, 40, "BOTH", "red")
	end

	if SWITCH_STARTSTART == 1 then
		draw_string(5, 20, "START", "green")
	end
	if SWITCH_STARTSTART == 0 then
		draw_string(5, 20, "START", "red")
	end

	if SWITCH_BAT == 1 then
		draw_string(50, 100, "BAT", "green")
	end
	if SWITCH_BAT == 0 then
		draw_string(50, 100, "BAT", "red")
	end

	if SWITCH_ALT == 1 then
		draw_string(50, 80, "ALT", "green")
	end
	if SWITCH_ALT == 0 then
		draw_string(50, 80, "ALT", "red")
	end

	if SWITCH_AVIONICS == 1 then
		draw_string(50, 60, "AV", "green")
	end
	if SWITCH_AVIONICS == 0 then
		draw_string(50, 60, "AV", "red")
	end

	if SWITCH_FUEL_PUMP == 1 then
		draw_string(50, 40, "FUEL", "green")
	end
	if SWITCH_FUEL_PUMP == 0 then
		draw_string(50, 40, "FUEL", "red")
	end

	if SWITCH_DEICE == 1 then
		draw_string(50, 20, "DEICE", "green")
	end
	if SWITCH_DEICE == 0 then
		draw_string(50, 20, "DEICE", "red")
	end

	if SWITCH_PITOT == 1 then
		draw_string(95, 100, "PITOT", "green")
	end
	if SWITCH_PITOT == 0 then
		draw_string(95, 100, "PITOT", "red")
	end

	if SWITCH_GEARUP == 1 then
		draw_string(95, 80, "GEARUP", "green")
	end
	if SWITCH_GEARUP == 0 then
		draw_string(95, 80, "GEARUP", "red")
	end

	if SWITCH_GEARDN == 1 then
		draw_string(95, 60, "GEARDN", "green")
	end
	if SWITCH_GEARDN == 0 then
		draw_string(95, 60, "GEARDN", "red")
	end

	if SWITCH_COWL == 1 then
		draw_string(95, 40, "COWL", "green")
	end
	if SWITCH_COWL == 0 then
		draw_string(95, 40, "COWL", "red")
	end

	if SWITCH_PANEL == 1 then
		draw_string(95, 20, "PANEL", "green")
	end
	if SWITCH_PANEL == 0 then
		draw_string(95, 20, "PANEL", "red")
	end

	if SWITCH_BEACON == 1 then
		draw_string(150, 100, "BEACON", "green")
	end
	if SWITCH_BEACON == 0 then
		draw_string(150, 100, "BEACON", "red")
	end

	if SWITCH_NAV == 1 then
		draw_string(150, 80, "NAV", "green")
	end
	if SWITCH_NAV == 0 then
		draw_string(150, 80, "NAV", "red")
	end

	if SWITCH_STROBE == 1 then
		draw_string(150, 60, "STROBE", "green")
	end
	if SWITCH_STROBE == 0 then
		draw_string(150, 60, "STROBE", "red")
	end

	if SWITCH_TAXI == 1 then
		draw_string(150, 40, "TAXI", "green")
	end
	if SWITCH_TAXI == 0 then
		draw_string(150, 40, "TAXI", "red")
	end

	if SWITCH_LANDING == 1 then
		draw_string(150, 20, "LANDING", "green")
	end
	if SWITCH_LANDING == 0 then
		draw_string(150, 20, "LANDING", "red")
	end


end

do_every_draw("test_switchpanel_hardware()")

do_every_frame("test_switchpanel_hardware()")

-- add a macro menu entry
add_macro(  "Switch Panel Tester",
            "test_switchpanel_is_on = true",
            "test_switchpanel_is_on = false",
            "deactivate")

