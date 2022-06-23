module(..., package.seeall);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- FlyWithLua xsaitekpanels library V1.0 build 06-01-2013
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Usage: Instead of defining the DataRefs, just insert a line >>require("xsaitekpanels")<<
--
-- This library defines a datareferences for each of the Saitek switch, 2 radio's and multi panel switch positions
--
--
-- You will get as writable DataRefs for the switch panel:
--
-- SWITCH_STARTOFF, SWITCH_STARTRIGHT, SWITCH_STARTLEFT, SWITCH_STARTBOTH, SWITCH_STARTSTART,
-- SWITCH_BAT, SWITCH_ALT, SWITCH_AVIONICS, SWITCH_FUEL_PUMP,
-- SWITCH_DEICE, SWITCH_PITOT, SWITCH_GEARUP, SWITCH_GEARDN,
-- SWITCH_COWL, SWITCH_PANEL,
-- SWITCH_BEACON, SWITCH_NAV, SWITCH_STROBE, SWITCH_TAXI,
-- SWITCH_LANDING
--
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

dataref("SWITCH_STARTOFF", "bgood/xsaitekpanels/switchpanel/startoff/status", "writable")
dataref("SWITCH_STARTRIGHT", "bgood/xsaitekpanels/switchpanel/startright/status", "writable")
dataref("SWITCH_STARTLEFT", "bgood/xsaitekpanels/switchpanel/startleft/status", "writable")
dataref("SWITCH_STARTBOTH", "bgood/xsaitekpanels/switchpanel/startboth/status", "writable")
dataref("SWITCH_STARTSTART", "bgood/xsaitekpanels/switchpanel/startstart/status", "writable")

dataref("SWITCH_BAT", "bgood/xsaitekpanels/switchpanel/bat/status", "writable")
dataref("SWITCH_ALT", "bgood/xsaitekpanels/switchpanel/alt/status", "writable")
dataref("SWITCH_AVIONICS", "bgood/xsaitekpanels/switchpanel/av/status", "writable")
dataref("SWITCH_FUEL_PUMP", "bgood/xsaitekpanels/switchpanel/fuel/status", "writable")
dataref("SWITCH_DEICE", "bgood/xsaitekpanels/switchpanel/dice/status", "writable")
dataref("SWITCH_PITOT", "bgood/xsaitekpanels/switchpanel/pitot/status", "writable")

dataref("SWITCH_GEARUP", "bgood/xsaitekpanels/switchpanel/gearup/status", "writable")
dataref("SWITCH_GEARDN", "bgood/xsaitekpanels/switchpanel/geardn/status", "writable")

dataref("SWITCH_COWL", "bgood/xsaitekpanels/switchpanel/cowl/status", "writable")
dataref("SWITCH_PANEL", "bgood/xsaitekpanels/switchpanel/panel/status", "writable")
dataref("SWITCH_BEACON", "bgood/xsaitekpanels/switchpanel/beacon/status", "writable")
dataref("SWITCH_NAV", "bgood/xsaitekpanels/switchpanel/nav/status", "writable")
dataref("SWITCH_STROBE", "bgood/xsaitekpanels/switchpanel/strobe/status", "writable")
dataref("SWITCH_TAXI", "bgood/xsaitekpanels/switchpanel/taxi/status", "writable")
dataref("SWITCH_LANDING", "bgood/xsaitekpanels/switchpanel/landing/status", "writable")
--
-- You will get as writable DataRefs for radio panel #1
--
-- RADIO1_UPPER_COM1, RADIO1_UPPER_COM2, RADIO1_UPPER_NAV1, RADIO1_UPPER_NAV2, RADIO1_UPPER_ADF,
-- RADIO1_UPPER_DME, RADIO1_UPPER_XPDR, RADIO1_UPPER_CORSE_INC, RADIO1_UPPER_CORSE_DEC,
-- RADIO1_UPPER_FINE_INC, RADIO1_UPPER_FINE_DEC, RADIO1_UPPER_ACT_STBY
-- RADIO1_LOWER_COM1, RADIO1_LOWER_COM2, RADIO1_LOWER_NAV1, RADIO1_LOWER_NAV2, RADIO1_LOWER_ADF,
-- RADIO1_LOWER_DME, RADIO1_LOWER_XPDR, RADIO1_LOWER_CORSE_INC, RADIO1_LOWER_CORSE_DEC,
-- RADIO1_LOWER_FINE_INC, RADIO1_LOWER_FINE_DEC, RADIO1_LOWER_ACT_STBY
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

dataref("RADIO1_UPPER_COM1", "bgood/xsaitekpanels/radiopanel/rad1uprcom1/status", "writable")
dataref("RADIO1_UPPER_COM2", "bgood/xsaitekpanels/radiopanel/rad1uprcom2/status", "writable")
dataref("RADIO1_UPPER_NAV1", "bgood/xsaitekpanels/radiopanel/rad1uprnav1/status", "writable")
dataref("RADIO1_UPPER_NAV2", "bgood/xsaitekpanels/radiopanel/rad1uprnav2/status", "writable")
dataref("RADIO1_UPPER_ADF", "bgood/xsaitekpanels/radiopanel/rad1upradf/status", "writable")
dataref("RADIO1_UPPER_DME", "bgood/xsaitekpanels/radiopanel/rad1uprdme/status", "writable")
dataref("RADIO1_UPPER_XPDR", "bgood/xsaitekpanels/radiopanel/rad1uprxpdr/status", "writable")
dataref("RADIO1_UPPER_CORSE_INC", "bgood/xsaitekpanels/radiopanel/rad1uprcorseinc/status", "writable")
dataref("RADIO1_UPPER_CORSE_DEC", "bgood/xsaitekpanels/radiopanel/rad1uprcorsedec/status", "writable")
dataref("RADIO1_UPPER_FINE_INC", "bgood/xsaitekpanels/radiopanel/rad1uprfineinc/status", "writable")
dataref("RADIO1_UPPER_FINE_DEC", "bgood/xsaitekpanels/radiopanel/rad1uprfinedec/status", "writable")
dataref("RADIO1_UPPER_ACT_STBY", "bgood/xsaitekpanels/radiopanel/rad1upractstby/status", "writable")

dataref("RADIO1_LOWER_COM1", "bgood/xsaitekpanels/radiopanel/rad1lwrcom1/status", "writable")
dataref("RADIO1_LOWER_COM2", "bgood/xsaitekpanels/radiopanel/rad1lwrcom2/status", "writable")
dataref("RADIO1_LOWER_NAV1", "bgood/xsaitekpanels/radiopanel/rad1lwrnav1/status", "writable")
dataref("RADIO1_LOWER_NAV2", "bgood/xsaitekpanels/radiopanel/rad1lwrnav2/status", "writable")
dataref("RADIO1_LOWER_ADF", "bgood/xsaitekpanels/radiopanel/rad1lwradf/status", "writable")
dataref("RADIO1_LOWER_DME", "bgood/xsaitekpanels/radiopanel/rad1lwrdme/status", "writable")
dataref("RADIO1_LOWER_XPDR", "bgood/xsaitekpanels/radiopanel/rad1lwrxpdr/status", "writable")
dataref("RADIO1_LOWER_CORSE_INC", "bgood/xsaitekpanels/radiopanel/rad1lwrcorseinc/status", "writable")
dataref("RADIO1_LOWER_CORSE_DEC", "bgood/xsaitekpanels/radiopanel/rad1lwrcorsedec/status", "writable")
dataref("RADIO1_LOWER_FINE_INC", "bgood/xsaitekpanels/radiopanel/rad1lwrfineinc/status", "writable")
dataref("RADIO1_LOWER_FINE_DEC", "bgood/xsaitekpanels/radiopanel/rad1lwrfinedec/status", "writable")
dataref("RADIO1_LOWER_ACT_STBY", "bgood/xsaitekpanels/radiopanel/rad1lwractstby/status", "writable")

-- You will get as writable DataRefs for radio panel #2
--
-- RADIO2_UPPER_COM1, RADIO2_UPPER_COM2, RADIO2_UPPER_NAV1, RADIO2_UPPER_NAV2, RADIO2_UPPER_ADF,
-- RADIO2_UPPER_DME, RADIO2_UPPER_XPDR, RADIO2_UPPER_CORSE_INC, RADIO2_UPPER_CORSE_DEC,
-- RADIO2_UPPER_FINE_INC, RADIO2_UPPER_FINE_DEC, RADIO1_UPPER_ACT_STBY
-- RADIO2_LOWER_COM1, RADIO2_LOWER_COM2, RADIO2_LOWER_NAV1, RADIO2_LOWER_NAV2, RADIO2_LOWER_ADF,
-- RADIO2_LOWER_DME, RADIO2_LOWER_XPDR, RADIO2_LOWER_CORSE_INC, RADIO2_LOWER_CORSE_DEC,
-- RADIO2_LOWER_FINE_INC, RADIO2_LOWER_FINE_DEC, RADIO2_LOWER_ACT_STBY
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

dataref("RADIO2_UPPER_COM1", "bgood/xsaitekpanels/radiopanel/rad2uprcom1/status", "writable")
dataref("RADIO2_UPPER_COM2", "bgood/xsaitekpanels/radiopanel/rad2uprcom2/status", "writable")
dataref("RADIO2_UPPER_NAV1", "bgood/xsaitekpanels/radiopanel/rad2uprnav1/status", "writable")
dataref("RADIO2_UPPER_NAV2", "bgood/xsaitekpanels/radiopanel/rad2uprnav2/status", "writable")
dataref("RADIO2_UPPER_ADF", "bgood/xsaitekpanels/radiopanel/rad2upradf/status", "writable")
dataref("RADIO2_UPPER_DME", "bgood/xsaitekpanels/radiopanel/rad2uprdme/status", "writable")
dataref("RADIO2_UPPER_XPDR", "bgood/xsaitekpanels/radiopanel/rad2uprxpdr/status", "writable")
dataref("RADIO2_UPPER_CORSE_INC", "bgood/xsaitekpanels/radiopanel/rad2uprcorseinc/status", "writable")
dataref("RADIO2_UPPER_CORSE_DEC", "bgood/xsaitekpanels/radiopanel/rad2uprcorsedec/status", "writable")
dataref("RADIO2_UPPER_FINE_INC", "bgood/xsaitekpanels/radiopanel/rad2uprfineinc/status", "writable")
dataref("RADIO2_UPPER_FINE_DEC", "bgood/xsaitekpanels/radiopanel/rad2uprfinedec/status", "writable")
dataref("RADIO2_UPPER_ACT_STBY", "bgood/xsaitekpanels/radiopanel/rad2upractstby/status", "writable")

dataref("RADIO2_LOWER_COM1", "bgood/xsaitekpanels/radiopanel/rad2lwrcom1/status", "writable")
dataref("RADIO2_LOWER_COM2", "bgood/xsaitekpanels/radiopanel/rad2lwrcom2/status", "writable")
dataref("RADIO2_LOWER_NAV1", "bgood/xsaitekpanels/radiopanel/rad2lwrnav1/status", "writable")
dataref("RADIO2_LOWER_NAV2", "bgood/xsaitekpanels/radiopanel/rad2lwrnav2/status", "writable")
dataref("RADIO2_LOWER_ADF", "bgood/xsaitekpanels/radiopanel/rad2lwradf/status", "writable")
dataref("RADIO2_LOWER_DME", "bgood/xsaitekpanels/radiopanel/rad2lwrdme/status", "writable")
dataref("RADIO2_LOWER_XPDR", "bgood/xsaitekpanels/radiopanel/rad2lwrxpdr/status", "writable")
dataref("RADIO2_LOWER_CORSE_INC", "bgood/xsaitekpanels/radiopanel/rad2lwrcorseinc/status", "writable")
dataref("RADIO2_LOWER_CORSE_DEC", "bgood/xsaitekpanels/radiopanel/rad2lwrcorsedec/status", "writable")
dataref("RADIO2_LOWER_FINE_INC", "bgood/xsaitekpanels/radiopanel/rad2lwrfineinc/status", "writable")
dataref("RADIO2_LOWER_FINE_DEC", "bgood/xsaitekpanels/radiopanel/rad2lwrfinedec/status", "writable")
dataref("RADIO2_LOWER_ACT_STBY", "bgood/xsaitekpanels/radiopanel/rad2lwractstby/status", "writable")

-- You will get as writable DataRefs for multi panel
--
-- MULTI_ALT_SWITCH, MULTI_VS_SWITCH, MULTI_IAS_SWITCH, MULTI HDG_SWITCH, MULTI_CRS_SWITCH,
-- MULTI_KNOB_INC, MULTI_KNOB_DEC, MULTI_AT_SWITCH, MULTI_TRIM_UP, MULTI_FLAPS_UP
-- MULTI_FLAPS_DN, MULTI_AP_BTN, MULTI_HDG_BTN, MULTI_NAV_BTN, MULTI_IAS_BTN 
-- MULTI_VS_BTN, MULTI_ALT_BTN, MULTI_APR_BTN, MULTI_REV_BTN
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

dataref("MULTI_ALT_SWITCH", "bgood/xsaitekpanels/multipanel/altswitch/status", "writable")
dataref("MULTI_VS_SWITCH", "bgood/xsaitekpanels/multipanel/vsswitch/status", "writable")
dataref("MULTI_IAS_SWITCH", "bgood/xsaitekpanels/multipanel/iasswitch/status", "writable")
dataref("MULTI_HDG_SWITCH", "bgood/xsaitekpanels/multipanel/hdgswitch/status", "writable")
dataref("MULTI_CRS_SWITCH",  "bgood/xsaitekpanels/multipanel/crsswitch/status", "writable")
dataref("MULTI_KNOB_INC", "bgood/xsaitekpanels/multipanel/knobinc/status", "writable")
dataref("MULTI_KNOB_DEC", "bgood/xsaitekpanels/multipanel/knobdec/status", "writable")
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
