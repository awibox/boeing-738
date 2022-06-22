-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Script:  Hadware tester for Saitek Radio Panel #1
-- Version: 1.0
-- Build:   06-04-2013
-- William Good
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Description:
-- Provide a script to test the Saitek Radio Panel #1 Hardware

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

require("xsaitekpanels")
require("graphics")

test_radio1panel_is_on = true

function test_radio1panel_hardware()

	if not test_radio1panel_is_on then return end

	draw_string(20, 325, "Radio Panel #1 Harware Tester", "green")

	if RADIO1_UPPER_COM1 == 1 then
		draw_string(5, 300, "COM1", "green")
	end
	if RADIO1_UPPER_COM1 == 0 then
		draw_string(5, 300, "COM1", "red")
	end

	if RADIO1_UPPER_COM2 == 1 then
		draw_string(5, 280, "COM2", "green")
	end
	if RADIO1_UPPER_COM2 == 0 then
		draw_string(5, 280, "COM2", "red")
	end

	if RADIO1_UPPER_NAV1 == 1 then
		draw_string(5, 260, "NAV1", "green")
	end
	if RADIO1_UPPER_NAV1 == 0 then
		draw_string(5, 260, "NAV1", "red")
	end

	if RADIO1_UPPER_NAV2 == 1 then
		draw_string(5, 240, "NAV2", "green")
	end
	if RADIO1_UPPER_NAV2 == 0 then
		draw_string(5, 240, "NAV2", "red")
	end

	if RADIO1_UPPER_ADF == 1 then
		draw_string(5, 220, "ADF", "green")
	end
	if RADIO1_UPPER_ADF == 0 then
		draw_string(5, 220, "ADF", "red")
	end

	if RADIO1_UPPER_DME == 1 then
		draw_string(5, 200, "DME", "green")
	end
	if RADIO1_UPPER_DME == 0 then
		draw_string(5, 200, "DME", "red")
	end

	if RADIO1_UPPER_XPDR == 1 then
		draw_string(5, 180, "XPDR", "green")
	end
	if RADIO1_UPPER_XPDR == 0 then
		draw_string(5, 180, "XPDR", "red")
	end

	if RADIO1_UPPER_CORSE_INC == 1 then
		draw_string(50, 300, "CORSE_INC", "green")
	end
	if RADIO1_UPPER_CORSE_INC == 0 then
		draw_string(50, 300, "CORSE_INC", "red")
	end

	if RADIO1_UPPER_CORSE_DEC == 1 then
		draw_string(50, 280, "CORSE_DEC", "green")
	end
	if RADIO1_UPPER_CORSE_DEC == 0 then
		draw_string(50, 280, "CORSE_DEC", "red")
	end

	if RADIO1_UPPER_FINE_INC == 1 then
		draw_string(50, 260, "FINE_INC", "green")
	end
	if RADIO1_UPPER_FINE_INC == 0 then
		draw_string(50, 260, "FINE_INC", "red")
	end

	if RADIO1_UPPER_FINE_DEC == 1 then
		draw_string(50, 240, "FINE_DEC", "green")
	end
	if RADIO1_UPPER_FINE_DEC == 0 then
		draw_string(50, 240, "FINE_DEC", "red")
	end

	if RADIO1_UPPER_ACT_STBY == 1 then
		draw_string(50, 220, "ACT_STBY", "green")
	end
	if RADIO1_UPPER_ACT_STBY == 0 then
		draw_string(50, 220, "ACT_STBY", "red")
	end



	if RADIO1_LOWER_COM1 == 1 then
		draw_string(5, 140, "COM1", "green")
	end
	if RADIO1_LOWER_COM1 == 0 then
		draw_string(5, 140, "COM1", "red")
	end

	if RADIO1_LOWER_COM2 == 1 then
		draw_string(5, 120, "COM2", "green")
	end
	if RADIO1_LOWER_COM2 == 0 then
		draw_string(5, 120, "COM2", "red")
	end

	if RADIO1_LOWER_NAV1 == 1 then
		draw_string(5, 100, "NAV1", "green")
	end
	if RADIO1_LOWER_NAV1 == 0 then
		draw_string(5, 100, "NAV1", "red")
	end

	if RADIO1_LOWER_NAV2 == 1 then
		draw_string(5, 80, "NAV2", "green")
	end
	if RADIO1_LOWER_NAV2 == 0 then
		draw_string(5, 80, "NAV2", "red")
	end

	if RADIO1_LOWER_ADF == 1 then
		draw_string(5, 60, "ADF", "green")
	end
	if RADIO1_LOWER_ADF == 0 then
		draw_string(5, 60, "ADF", "red")
	end

	if RADIO1_LOWER_DME == 1 then
		draw_string(5, 40, "DME", "green")
	end
	if RADIO1_LOWER_DME == 0 then
		draw_string(5, 40, "DME", "red")
	end

	if RADIO1_LOWER_XPDR == 1 then
		draw_string(5, 20, "XPDR", "green")
	end
	if RADIO1_LOWER_XPDR == 0 then
		draw_string(5, 20, "XPDR", "red")
	end

	if RADIO1_LOWER_CORSE_INC == 1 then
		draw_string(50, 140, "CORSE_INC", "green")
	end
	if RADIO1_LOWER_CORSE_INC == 0 then
		draw_string(50, 140, "CORSE_INC", "red")
	end

	if RADIO1_LOWER_CORSE_DEC == 1 then
		draw_string(50, 120, "CORSE_DEC", "green")
	end
	if RADIO1_LOWER_CORSE_DEC == 0 then
		draw_string(50, 120, "CORSE_DEC", "red")
	end

	if RADIO1_LOWER_FINE_INC == 1 then
		draw_string(50, 100, "FINE_INC", "green")
	end
	if RADIO1_LOWER_FINE_INC == 0 then
		draw_string(50, 100, "FINE_INC", "red")
	end

	if RADIO1_LOWER_FINE_DEC == 1 then
		draw_string(50, 80, "FINE_DEC", "green")
	end
	if RADIO1_LOWER_FINE_DEC == 0 then
		draw_string(50, 80, "FINE_DEC", "red")
	end

	if RADIO1_LOWER_ACT_STBY == 1 then
		draw_string(50, 60, "ACT_STBY", "green")
	end
	if RADIO1_LOWER_ACT_STBY == 0 then
		draw_string(50, 60, "ACT_STBY", "red")
	end







end

do_every_draw("test_radio1panel_hardware()")

do_every_frame("test_radio1panel_hardware()")

-- add a macro menu entry
add_macro(  "Radio Panel1 Tester",
            "test_radio1panel_is_on = true",
            "test_radio1panel_is_on = false",
            "deactivate")

