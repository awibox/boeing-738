module(..., package.seeall);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- FlyWithLua xsaitekpanels_multi library V1.2 build 01-03-2016
-- Added MULTI_KNOB_INC_TICKS and MULTI_KNOB_DEC_TICKS 01-03-2016 Thanks to Robert Steffens
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Usage: Instead of defining the DataRefs, just insert a line >>require("xsaitekpanels_multi")<<
--
-- This library defines a datareferences for the multi panel switch positions
--
--
-- You will get as writable DataRefs for multi panel
--
-- MULTI_ALT_SWITCH, MULTI_VS_SWITCH, MULTI_IAS_SWITCH, MULTI HDG_SWITCH, MULTI_CRS_SWITCH,
-- MULTI_KNOB_INC, MULTI_KNOB_DEC, MULTI_KNOB_INC_TICKS, MULTI_KNOB_DEC_TICKS, MULTI_AT_SWITCH
-- MULTI_TRIM_UP, MULTI_FLAPS_UP, MULTI_FLAPS_DN, MULTI_AP_BTN, MULTI_HDG_BTN, MULTI_NAV_BTN  
-- MULTI_IAS_BTN, MULTI_VS_BTN, MULTI_ALT_BTN, MULTI_APR_BTN, MULTI_REV_BTN
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
logMsg ( "FlyWithLua Info: ** FlyWithLua xsaitekpanels_multi library V1.2 build 01-03-2016 **" )

dataref("MULTI_ALT_SWITCH", "bgood/xsaitekpanels/multipanel/altswitch/status", "writable")
dataref("MULTI_VS_SWITCH", "bgood/xsaitekpanels/multipanel/vsswitch/status", "writable")
dataref("MULTI_IAS_SWITCH", "bgood/xsaitekpanels/multipanel/iasswitch/status", "writable")
dataref("MULTI_HDG_SWITCH", "bgood/xsaitekpanels/multipanel/hdgswitch/status", "writable")
dataref("MULTI_CRS_SWITCH",  "bgood/xsaitekpanels/multipanel/crsswitch/status", "writable")
dataref("MULTI_KNOB_INC", "bgood/xsaitekpanels/multipanel/knobinc/status", "writable")
dataref("MULTI_KNOB_DEC", "bgood/xsaitekpanels/multipanel/knobdec/status", "writable")
dataref("MULTI_KNOB_INC_TICKS", "bgood/xsaitekpanels/multipanel/knobincticks/status", "writable")
dataref("MULTI_KNOB_DEC_TICKS", "bgood/xsaitekpanels/multipanel/knobdecticks/status", "writable")
dataref("MULTI_AT_SWITCH", "bgood/xsaitekpanels/multipanel/at/status", "writable")
dataref("MULTI_TRIM_UP", "bgood/xsaitekpanels/multipanel/trimup/status", "writable")
dataref("MULTI_TRIM_DN", "bgood/xsaitekpanels/multipanel/trimdn/status", "writable")
dataref("MULTI_FLAPS_UP", "bgood/xsaitekpanels/multipanel/flapsup/status", "writable")
dataref("MULTI_FLAPS_DN", "bgood/xsaitekpanels/multipanel/flapsdn/status", "writable")
dataref("MULTI_AP_BTN", "bgood/xsaitekpanels/multipanel/apbtn/status", "writable")
dataref("MULTI_HDG_BTN", "bgood/xsaitekpanels/multipanel/hdgbtn/status", "writable")
dataref("MULTI_NAV_BTN", "bgood/xsaitekpanels/multipanel/navbtn/status", "writable")
dataref("MULTI_IAS_BTN", "bgood/xsaitekpanels/multipanel/iasbtn/status", "writable")
dataref("MULTI_VS_BTN", "bgood/xsaitekpanels/multipanel/vsbtn/status", "writable")
dataref("MULTI_ALT_BTN", "bgood/xsaitekpanels/multipanel/altbtn/status", "writable")
dataref("MULTI_APR_BTN", "bgood/xsaitekpanels/multipanel/aprbtn/status", "writable")
dataref("MULTI_REV_BTN", "bgood/xsaitekpanels/multipanel/revbtn/status", "writable")
