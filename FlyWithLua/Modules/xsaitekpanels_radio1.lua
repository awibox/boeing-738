module(..., package.seeall);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- FlyWithLua xsaitekpanels_radio1 library V1.3 build 01-16-2016
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Usage: Instead of defining the DataRefs, just insert a line >>require("xsaitekpanels_radio1")<<
--
-- This library defines a datareferences for the Saitek radio panel switch positions
--
--
--
-- You will get as writable DataRefs for radio panel #1
--
-- RADIO1_UPPER_COM1, RADIO1_UPPER_COM2, RADIO1_UPPER_NAV1, RADIO1_UPPER_NAV2, RADIO1_UPPER_ADF
-- RADIO1_UPPER_DME, RADIO1_UPPER_XPDR, RADIO1_UPPER_CORSE_INC, RADIO1_UPPER_CORSE_DEC
-- RADIO1_UPPER_FINE_INC, RADIO1_UPPER_FINE_DEC, RADIO1_UPPER_CORSE_INC_TICKS, RADIO1_UPPER_CORSE_DEC_TICKS
-- RADIO1_UPPER_FINE_INC_TICKS, RADIO1_UPPER_FINE_DEC_TICKS, RADIO1_UPPER_ACT_STBY
-- RADIO1_LOWER_COM1, RADIO1_LOWER_COM2, RADIO1_LOWER_NAV1, RADIO1_LOWER_NAV2, RADIO1_LOWER_ADF
-- RADIO1_LOWER_DME, RADIO1_LOWER_XPDR, RADIO1_LOWER_CORSE_INC, RADIO1_LOWER_CORSE_DEC
-- RADIO1_LOWER_FINE_INC, RADIO1_LOWER_FINE_DEC, RADIO1_LOWER_CORSE_INC_TICKS, RADIO1_LOWER_CORSE_DEC_TICKS
-- RADIO1_LOWER_FINE_INC_TICKS, RADIO1_LOWER_FINE_DEC_TICKS, RADIO1_LOWER_ACT_STBY
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
logMsg ( "FlyWithLua Info: ** FlyWithLua xsaitekpanels_radio1 library V1.3 build 01-16-2016 **" )

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
dataref("RADIO1_UPPER_CORSE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad1uprcorseincticks/status", "writable")
dataref("RADIO1_UPPER_CORSE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad1uprcorsedecticks/status", "writable")
dataref("RADIO1_UPPER_FINE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad1uprfineincticks/status", "writable")
dataref("RADIO1_UPPER_FINE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad1uprfinedecticks/status", "writable")
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
dataref("RADIO1_LOWER_CORSE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad1lwrcorseincticks/status", "writable")
dataref("RADIO1_LOWER_CORSE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad1lwrcorsedecticks/status", "writable")
dataref("RADIO1_LOWER_FINE_INC_TICKS", "bgood/xsaitekpanels/radiopanel/rad1lwrfineincticks/status", "writable")
dataref("RADIO1_LOWER_FINE_DEC_TICKS", "bgood/xsaitekpanels/radiopanel/rad1lwrfinedecticks/status", "writable")
dataref("RADIO1_LOWER_ACT_STBY", "bgood/xsaitekpanels/radiopanel/rad1lwractstby/status", "writable")
