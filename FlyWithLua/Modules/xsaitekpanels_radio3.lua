module(..., package.seeall);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- FlyWithLua xsaitekpanels_radio3 library V1.5 build 12-07-2017
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Usage: Instead of defining the DataRefs, just insert a line >>require("xsaitekpanels_radio3")<<
--
-- This library defines a datareferences for the second Saitek radio panel switch positions
--
--
-- You will get as writable DataRefs for radio panel #3
--
-- RADIO3_UPPER_COM1, RADIO3_UPPER_COM2, RADIO3_UPPER_NAV1, RADIO3_UPPER_NAV2, RADIO3_UPPER_ADF,
-- RADIO3_UPPER_DME, RADIO3_UPPER_XPDR, RADIO3_UPPER_CORSE_INC, RADIO3_UPPER_CORSE_DEC,
-- RADIO3_UPPER_FINE_INC, RADIO3_UPPER_FINE_DEC, RADIO3_UPPER_CORSE_INC_TICKS, RADIO3_UPPER_CORSE_DEC_TICKS
-- RADIO3_UPPER_FINE_INC_TICKS, RADIO3_UPPER_FINE_DEC_TICKS, RADIO3_UPPER_ACT_STBY
-- RADIO3_LOWER_COM1, RADIO3_LOWER_COM2, RADIO3_LOWER_NAV1, RADIO3_LOWER_NAV2, RADIO3_LOWER_ADF,
-- RADIO3_LOWER_DME, RADIO3_LOWER_XPDR, RADIO3_LOWER_CORSE_INC, RADIO3_LOWER_CORSE_DEC,
-- RADIO3_LOWER_FINE_INC, RADIO3_LOWER_FINE_DEC, RADIO3_LOWER_CORSE_INC_TICKS, RADIO3_LOWER_CORSE_DEC_TICKS
-- RADIO3_LOWER_FINE_INC_TICKS, RADIO3_LOWER_FINE_DEC_TICKS, RADIO3_LOWER_ACT_STBY
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
logMsg ( "FlyWithLua Info: ** FlyWithLua xsaitekpanels_radio3 library V1.5 build 12-07-2017 **" )

dataref("RADIO3_UPPER_COM1", "bgood/xsaitekpanels/radiopanel/rad3uprcom1/status", "writable")
dataref("RADIO3_UPPER_COM2", "bgood/xsaitekpanels/radiopanel/rad3uprcom2/status", "writable")
dataref("RADIO3_UPPER_NAV1", "bgood/xsaitekpanels/radiopanel/rad3uprnav1/status", "writable")
dataref("RADIO3_UPPER_NAV2", "bgood/xsaitekpanels/radiopanel/rad3uprnav2/status", "writable")
dataref("RADIO3_UPPER_ADF", "bgood/xsaitekpanels/radiopanel/rad3upradf/status", "writable")
dataref("RADIO3_UPPER_DME", "bgood/xsaitekpanels/radiopanel/rad3uprdme/status", "writable")
dataref("RADIO3_UPPER_XPDR", "bgood/xsaitekpanels/radiopanel/rad3uprxpdr/status", "writable")
dataref("RADIO3_UPPER_CORSE_INC", "bgood/xsaitekpanels/radiopanel/rad3uprcorseinc/status", "writable")
dataref("RADIO3_UPPER_CORSE_DEC", "bgood/xsaitekpanels/radiopanel/rad3uprcorsedec/status", "writable")
dataref("RADIO3_UPPER_FINE_INC", "bgood/xsaitekpanels/radiopanel/rad3uprfineinc/status", "writable")
dataref("RADIO3_UPPER_FINE_DEC", "bgood/xsaitekpanels/radiopanel/rad3uprfinedec/status", "writable")
dataref("RADIO3_UPPER_CORSE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad3uprcorseincticks/status", "writable")
dataref("RADIO3_UPPER_CORSE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad3uprcorsedecticks/status", "writable")
dataref("RADIO3_UPPER_FINE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad3uprfineincticks/status", "writable")
dataref("RADIO3_UPPER_FINE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad3uprfinedecticks/status", "writable")
dataref("RADIO3_UPPER_ACT_STBY", "bgood/xsaitekpanels/radiopanel/rad3upractstby/status", "writable")


dataref("RADIO3_LOWER_COM1", "bgood/xsaitekpanels/radiopanel/rad3lwrcom1/status", "writable")
dataref("RADIO3_LOWER_COM2", "bgood/xsaitekpanels/radiopanel/rad3lwrcom2/status", "writable")
dataref("RADIO3_LOWER_NAV1", "bgood/xsaitekpanels/radiopanel/rad3lwrnav1/status", "writable")
dataref("RADIO3_LOWER_NAV2", "bgood/xsaitekpanels/radiopanel/rad3lwrnav2/status", "writable")
dataref("RADIO3_LOWER_ADF", "bgood/xsaitekpanels/radiopanel/rad3lwradf/status", "writable")
dataref("RADIO3_LOWER_DME", "bgood/xsaitekpanels/radiopanel/rad3lwrdme/status", "writable")
dataref("RADIO3_LOWER_XPDR", "bgood/xsaitekpanels/radiopanel/rad3lwrxpdr/status", "writable")
dataref("RADIO3_LOWER_CORSE_INC", "bgood/xsaitekpanels/radiopanel/rad3lwrcorseinc/status", "writable")
dataref("RADIO3_LOWER_CORSE_DEC", "bgood/xsaitekpanels/radiopanel/rad3lwrcorsedec/status", "writable")
dataref("RADIO3_LOWER_FINE_INC", "bgood/xsaitekpanels/radiopanel/rad3lwrfineinc/status", "writable")
dataref("RADIO3_LOWER_FINE_DEC", "bgood/xsaitekpanels/radiopanel/rad3lwrfinedec/status", "writable")
dataref("RADIO3_LOWER_CORSE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad3lwrcorseincticks/status", "writable")
dataref("RADIO3_LOWER_CORSE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad3lwrcorsedecticks/status", "writable")
dataref("RADIO3_LOWER_FINE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad3lwrfineincticks/status", "writable")
dataref("RADIO3_LOWER_FINE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad3lwrfinedecticks/status", "writable")
dataref("RADIO3_LOWER_ACT_STBY", "bgood/xsaitekpanels/radiopanel/rad3lwractstby/status", "writable")
