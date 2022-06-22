module(..., package.seeall);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- FlyWithLua xsaitekpanels_radio2 library V1.3 build 01-16-2016
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Usage: Instead of defining the DataRefs, just insert a line >>require("xsaitekpanels_radio2")<<
--
-- This library defines a datareferences for the second Saitek radio panel switch positions
--
--
-- You will get as writable DataRefs for radio panel #2
--
-- RADIO2_UPPER_COM1, RADIO2_UPPER_COM2, RADIO2_UPPER_NAV1, RADIO2_UPPER_NAV2, RADIO2_UPPER_ADF,
-- RADIO2_UPPER_DME, RADIO2_UPPER_XPDR, RADIO2_UPPER_CORSE_INC, RADIO2_UPPER_CORSE_DEC,
-- RADIO2_UPPER_FINE_INC, RADIO2_UPPER_FINE_DEC, RADIO2_UPPER_CORSE_INC_TICKS, RADIO2_UPPER_CORSE_DEC_TICKS
-- RADIO2_UPPER_FINE_INC_TICKS, RADIO2_UPPER_FINE_DEC_TICKS, RADIO1_UPPER_ACT_STBY
-- RADIO2_LOWER_COM1, RADIO2_LOWER_COM2, RADIO2_LOWER_NAV1, RADIO2_LOWER_NAV2, RADIO2_LOWER_ADF,
-- RADIO2_LOWER_DME, RADIO2_LOWER_XPDR, RADIO2_LOWER_CORSE_INC, RADIO2_LOWER_CORSE_DEC,
-- RADIO2_LOWER_FINE_INC, RADIO2_LOWER_FINE_DEC, RADIO2_LOWER_CORSE_INC_TICKS, RADIO2_LOWER_CORSE_DEC_TICKS
-- RADIO2_LOWER_FINE_INC_TICKS, RADIO2_LOWER_FINE_DEC_TICKS, RADIO2_LOWER_ACT_STBY
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
logMsg ( "FlyWithLua Info: ** FlyWithLua xsaitekpanels_radio2 library V1.3 build 01-16-2016 **" )

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
dataref("RADIO2_UPPER_CORSE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad2uprcorseincticks/status", "writable")
dataref("RADIO2_UPPER_CORSE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad2uprcorsedecticks/status", "writable")
dataref("RADIO2_UPPER_FINE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad2uprfineincticks/status", "writable")
dataref("RADIO2_UPPER_FINE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad2uprfinedecticks/status", "writable")
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
dataref("RADIO2_LOWER_CORSE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad2lwrcorseincticks/status", "writable")
dataref("RADIO2_LOWER_CORSE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad2lwrcorsedecticks/status", "writable")
dataref("RADIO2_LOWER_FINE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad2lwrfineincticks/status", "writable")
dataref("RADIO2_LOWER_FINE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad2lwrfinedecticks/status", "writable")
dataref("RADIO2_LOWER_ACT_STBY", "bgood/xsaitekpanels/radiopanel/rad2lwractstby/status", "writable")
