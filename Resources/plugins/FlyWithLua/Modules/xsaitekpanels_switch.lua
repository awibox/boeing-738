module(..., package.seeall);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- FlyWithLua xsaitekpanels_switch library V1.1 build 01-14-2016
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Usage: Instead of defining the DataRefs, just insert a line >>require("xsaitekpanels_switch")<<
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
logMsg ( "FlyWithLua Info: ** FlyWithLua xsaitekpanels_switch library V1.1 build 01-14-2016 **" )

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
