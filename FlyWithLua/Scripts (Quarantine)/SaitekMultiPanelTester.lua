-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Script:  Hadware tester for Saitek Multi Panel
-- Version: 1.0
-- Build:   06-04-2013
-- William Good
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Description:
-- Provide a script to test the Saitek Multi Panel Hardware

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

require("xsaitekpanels")
require("graphics")

test_multipanel_is_on = true

function test_multipanel_hardware()

	if not test_multipanel_is_on then return end

	draw_string(20, 125, "Multi Panel Harware Tester", "green")


	if MULTI_ALT_SWITCH == 1 then
		draw_string(5, 100, "ALT_SWITCH", "green")
	end
	if MULTI_ALT_SWITCH == 0 then
		draw_string(5, 100, "ALT_SWITCH", "red")
	end

	if MULTI_VS_SWITCH == 1 then
		draw_string(5, 80, "VS_SWITCH", "green")
	end
	if MULTI_VS_SWITCH == 0 then
		draw_string(5, 80, "VS_SWITCH", "red")
	end

	if MULTI_IAS_SWITCH == 1 then
		draw_string(5, 60, "IAS_SWITCH", "green")
	end
	if MULTI_IAS_SWITCH == 0 then
		draw_string(5, 60, "IAS_SWITCH", "red")
	end

	if MULTI_HDG_SWITCH == 1 then
		draw_string(5, 40, "HDG_SWITCH", "green")
	end
	if MULTI_HDG_SWITCH == 0 then
		draw_string(5, 40, "HDG_SWITCH", "red")
	end

	if MULTI_CRS_SWITCH == 1 then
		draw_string(5, 20, "CRS_SWITCH", "green")
	end
	if MULTI_CRS_SWITCH == 0 then
		draw_string(5, 20, "CRS_SWITCH", "red")
	end

	if MULTI_KNOB_INC == 1 then
		draw_string(80, 100, "KNOB_INC", "green")
	end
	if MULTI_KNOB_INC == 0 then
		draw_string(80, 100, "KNOB_INC", "red")
	end

	if MULTI_KNOB_DEC == 1 then
		draw_string(80, 80, "KNOB_DEC", "green")
	end
	if MULTI_KNOB_DEC == 0 then
		draw_string(80, 80, "KNOB_DEC", "red")
	end

	if MULTI_AT_SWITCH == 1 then
		draw_string(80, 60, "AT", "green")
	end
	if MULTI_AT_SWITCH == 0 then
		draw_string(80, 60, "AT", "red")
	end

	if MULTI_TRIM_UP == 1 then
		draw_string(80, 40, "TRIM_UP", "green")
	end
	if MULTI_TRIM_UP == 0 then
		draw_string(80, 40, "TRIM_UP", "red")
	end

	if MULTI_TRIM_DN == 1 then
		draw_string(80, 20, "TRIM_DN", "green")
	end
	if MULTI_TRIM_DN == 0 then
		draw_string(80, 20, "TRIM_DN", "red")
	end

	if MULTI_FLAPS_UP == 1 then
		draw_string(155, 100, "FLAPS_UP", "green")
	end
	if MULTI_FLAPS_UP == 0 then
		draw_string(155, 100, "FLAPS_UP", "red")
	end

	if MULTI_FLAPS_DN == 1 then
		draw_string(155, 80, "FLAPS_DN", "green")
	end
	if MULTI_FLAPS_DN == 0 then
		draw_string(155, 80, "FLAPS_DN", "red")
	end

	if MULTI_AP_BTN == 1 then
		draw_string(155, 60, "AP_BTN", "green")
	end
	if MULTI_AP_BTN == 0 then
		draw_string(155, 60, "AP_BTN", "red")
	end

	if MULTI_HDG_BTN == 1 then
		draw_string(155, 40, "HDG_BTN", "green")
	end
	if MULTI_HDG_BTN == 0 then
		draw_string(155, 40, "HDG_BTN", "red")
	end

	if MULTI_NAV_BTN == 1 then
		draw_string(155, 20, "NAV_BTN", "green")
	end
	if MULTI_NAV_BTN == 0 then
		draw_string(155, 20, "NAV_BTN", "red")
	end

	if MULTI_IAS_BTN == 1 then
		draw_string(220, 100, "IAS_BTN", "green")
	end
	if MULTI_IAS_BTN == 0 then
		draw_string(220, 100, "IAS_BTN", "red")
	end

	if MULTI_ALT_BTN == 1 then
		draw_string(220, 80, "ALT_BTN", "green")
	end
	if MULTI_ALT_BTN == 0 then
		draw_string(220, 80, "ALT_BTN", "red")
	end

	if MULTI_VS_BTN == 1 then
		draw_string(220, 60, "VS_BTN", "green")
	end
	if MULTI_VS_BTN == 0 then
		draw_string(220, 60, "VS_BTN", "red")
	end

	if MULTI_APR_BTN == 1 then
		draw_string(220, 40, "APR_BTN", "green")
	end
	if MULTI_APR_BTN == 0 then
		draw_string(220, 40, "APR_BTN", "red")
	end

	if MULTI_REV_BTN == 1 then
		draw_string(220, 20, "REV_BTN", "green")
	end
	if MULTI_REV_BTN == 0 then
		draw_string(220, 20, "REV_BTN", "red")
	end


end

do_every_draw("test_multipanel_hardware()")

do_every_frame("test_multipanel_hardware()")

-- add a macro menu entry
add_macro(  "Multi Panel Tester",
            "test_multipanel_is_on = true",
            "test_multipanel_is_on = false",
            "deactivate")

