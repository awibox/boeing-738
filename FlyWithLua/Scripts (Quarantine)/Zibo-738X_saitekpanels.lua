
if (PLANE_ICAO == "B737" or PLANE_ICAO == "B738" or PLANE_ICAO == "B739") and (XPLMFindDataRef("laminar/B738/engine/indicators/N2_percent_1")) then

	-- --------------------------------------------------------------------------------
	-- SAITEK PANELS for Zibo Boeing 737-800, 700U and 900U by Geoff Lohrere
	-- --------------------------------------------------------------------------------

	-- Global Variables
	Script_Title = "Saitek script for Zibo "..PLANE_ICAO..""
	Script_Version = "2.0.8"
	End_Time = os.time()
	Msg_Timer = 20
	Help_Menu = 0
	Init_Count = 5
	Auto_Start = 0
	PanelsReady = false
	SwitchPanel = false
	RadioPanel = false
	MultiPanel = false
	Mag_Switch_Mode = false
	local plugin_Signature = "XPlane Plugin.1.2.6.0"
	dataref("SIM_TIME", "sim/time/total_running_time_sec", "readonly")

	-- --------------------------------------------------------------------------------
	-- disable conflicting saitek plugin by signature and ID
	-- --------------------------------------------------------------------------------

	-- make sure the script does not stop old FlyWithLua versions
	if not SUPPORTS_FLOATING_WINDOWS then
	logMsg("imgui not supported by your FlyWithLua version")
	return
	end

	-- load the XPLM library
	local ffi = require("ffi")

	-- find the right lib to load
	local XPLMlib = ""
	if SYSTEM == "IBM" then
		-- Windows OS (no path and file extension needed)
		if SYSTEM_ARCHITECTURE == 64 then
			XPLMlib = "XPLM_64"	-- 64bit
		else
			XPLMlib = "XPLM"	-- 32bit
		end
	elseif SYSTEM == "LIN" then
		-- Linux OS (needs the path "Resources/plugins/" for some reason)
		if SYSTEM_ARCHITECTURE == 64 then
			XPLMlib = "Resources/plugins/XPLM_64.so"	-- 64bit
		else
			XPLMlib = "Resources/plugins/XPLM.so"		-- 32bit
		end
	elseif SYSTEM == "APL" then
		-- Mac OS (needs the path "Resources/plugins/" for some reason)
		XPLMlib = "Resources/plugins/XPLM.framework/XPLM"	-- 64bit and 32 bit
	else
		return
	end

	-- load the lib and store in local variable
	local XPLM = ffi.load(XPLMlib)

	-- define XPLM functions
	ffi.cdef[[
	typedef int XPLMPluginID;
	int XPLMFindPluginBySignature(
		const char *inSignature);
	void XPLMDisablePlugin(
		XPLMPluginID inPluginID);
	int XPLMEnablePlugin(
		XPLMPluginID inPluginID);
	]]

	-- find plugin ID based on Signature
	local sig_return = XPLM.XPLMFindPluginBySignature(plugin_Signature)
	if (sig_return > 0) then
		logMsg("FlyWithLua Info: ** Plugin '"..plugin_Signature.."' found via Signature, ID = "..sig_return..". Disabling::It conflicts with "..Script_Title.."")
		XPLM.XPLMDisablePlugin(sig_return)
		XPlanePluginID = "Yes (id="..sig_return..")"
		PluginStatus = 0
	else
		logMsg("FlyWithLua Info: ** Plugin '"..plugin_Signature.."' not found via Signature. Saitek plugin not loaded so nothing to disable")
		XPlanePluginID = "No"
	end

	function Init_Loop()
		if PanelsReady == true then return end

		dataref("SwitchPanelCount", "bgood/xsaitekpanels/switchpanel/count", "writable")
		dataref("RadioPanelCount", "bgood/xsaitekpanels/radiopanel/count", "writable")
		dataref("MultiPanelCount", "bgood/xsaitekpanels/multipanel/count", "writable")
		if SwitchPanelCount > 0 then SwitchPanel = true end
		if RadioPanelCount > 0 then RadioPanel = true end
		if MultiPanelCount > 0 then MultiPanel = true end

		if SwitchPanel == false and RadioPanel == false and MultiPanel == false then return end
		PanelsReady = true
		logMsg ("FlyWithLua Info: ** Starting Zibo "..PLANE_ICAO.." version "..Script_Version.." for multi and switch panel")

		dataref("FN_BUTTON", "bgood/xsaitekpanels/fnbutton/status", "readonly")

		if SwitchPanel then
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
			dataref("SWITCH_COWL", "bgood/xsaitekpanels/switchpanel/cowl/status", "writable")
			dataref("SWITCH_PANEL", "bgood/xsaitekpanels/switchpanel/panel/status", "writable")
			dataref("SWITCH_BEACON", "bgood/xsaitekpanels/switchpanel/beacon/status", "writable")
			dataref("SWITCH_STROBE", "bgood/xsaitekpanels/switchpanel/strobe/status", "writable")
			dataref("SWITCH_TAXI", "bgood/xsaitekpanels/switchpanel/taxi/status", "writable")
			dataref("SWITCH_LANDING", "bgood/xsaitekpanels/switchpanel/landing/status", "writable")

			dataref("N2_Eng1", "laminar/B738/engine/indicators/N2_percent_1", "readonly")
			dataref("N2_Eng2", "laminar/B738/engine/indicators/N2_percent_2", "readonly")
			dataref("Starter1_Pos", "laminar/B738/engine/starter1_pos", "readonly")
			dataref("Starter2_Pos", "laminar/B738/engine/starter2_pos", "readonly")
			dataref("Fuel_Cutoff1", "laminar/B738/engine/mixture_ratio1", "readonly")
			dataref("Fuel_Cutoff2", "laminar/B738/engine/mixture_ratio2", "readonly")
			dataref("Fuel_lft1_Status", "laminar/B738/fuel/fuel_tank_pos_lft1", "readonly")
			dataref("Fuel_lft2_Status", "laminar/B738/fuel/fuel_tank_pos_lft2", "readonly")
			dataref("Fuel_rgt1_Status", "laminar/B738/fuel/fuel_tank_pos_rgt1", "readonly")
			dataref("Fuel_rgt2_Status", "laminar/B738/fuel/fuel_tank_pos_rgt2", "readonly")
			dataref("APU_N1_Percent", "sim/cockpit2/electrical/APU_N1_percent", "readonly")
			dataref("APUGen_OffBus", "laminar/B738/annunciator/apu_gen_off_bus", "readonly")
			dataref("Battery_Cover", "laminar/B738/button_switch/cover_position", "readonly",2)
			dataref("Battery_Position", "laminar/B738/electric/battery_pos", "writable")
			dataref("GPU_Status", "sim/cockpit/electrical/gpu_on", "readonly")
			dataref("GPU_Connect", "laminar/B738/gpu_hide", "readonly")
			dataref("ASU_Connect", "laminar/B738/engine/hide_asu", "readonly")
			if XPLMFindDataRef("laminar/B738/system/fuel_press_c1") then
				dataref("Low_PressureC1", "laminar/B738/system/fuel_press_c1", "readonly")
				dataref("Low_PressureC2", "laminar/B738/system/fuel_press_c2", "readonly")
				Fuel_Low = 0
			else
				dataref("Low_PressureC1", "laminar/B738/annunciator/low_fuel_press_c1", "readonly")
				dataref("Low_PressureC2", "laminar/B738/annunciator/low_fuel_press_c2", "readonly")
				Fuel_Low = 1
			end
			dataref("Panel_Brightness0", "laminar/B738/electric/panel_brightness", "writable",0)
			dataref("Panel_Brightness1", "laminar/B738/electric/panel_brightness", "writable",1)
			dataref("Panel_Brightness2", "laminar/B738/electric/panel_brightness", "writable",2)
			dataref("Panel_Brightness3", "laminar/B738/electric/panel_brightness", "writable",3)
			dataref("Flood_Brightness6", "sim/cockpit2/switches/generic_lights_switch", "writable",6)
			dataref("Flood_Brightness7", "sim/cockpit2/switches/generic_lights_switch", "writable",7)
			dataref("Flood_Brightness8", "sim/cockpit2/switches/generic_lights_switch", "writable",8)
			dataref("Flood_Brightness10", "sim/cockpit2/switches/generic_lights_switch", "writable",10)
			dataref("Flood_Brightness11", "sim/cockpit2/switches/generic_lights_switch", "writable",11)
			dataref("Flood_Brightness12", "sim/cockpit2/switches/generic_lights_switch", "writable",12)
			dataref("ADIRUSwitchL", "laminar/B738/toggle_switch/irs_left", "readonly")
			dataref("ADIRUSwitchR", "laminar/B738/toggle_switch/irs_right", "readonly")
			dataref("SET_IRS_POS", "laminar/B738/fmc1/Line04_L")
			dataref("LAST_POS", "laminar/B738/fmc1/Line01_X")
			dataref("Auto_Brakes", "laminar/B738/autobrake/autobrake_pos", "readonly")
			dataref("Avi_Brightness", "avitab/brightness", "writable")
		end

		if RadioPanel then
			dataref("ACTSTBY_STATUS_UP", "bgood/xsaitekpanels/radiopanel/rad1upractstby/status", "readonly")
			dataref("XPDR_STATUS_UP", "bgood/xsaitekpanels/radiopanel/rad1uprxpdr/status", "readonly")
			dataref("XPDR_CRS_INC_UP", "bgood/xsaitekpanels/radiopanel/rad1uprfineincticks/status", "readonly")
			dataref("XPDR_CRS_DEC_UP", "bgood/xsaitekpanels/radiopanel/rad1uprfinedecticks/status", "readonly")
			XPDR_Delay = SIM_TIME + 0.25
			CAP_FO_QNH = true
		end

		if MultiPanel then
			-- Integers for MP button lights, 1-AP 2-HDG 3-NAV 4-IAS 5-ALT 6-VS 7-APR 8-REV
			dataref("Status_Integer1", "bgood/xsaitekpanels/sharedata/integer1", "writable")
			dataref("Status_Integer2", "bgood/xsaitekpanels/sharedata/integer2", "writable")
			dataref("Status_Integer3", "bgood/xsaitekpanels/sharedata/integer3", "writable")
			dataref("Status_Integer4", "bgood/xsaitekpanels/sharedata/integer4", "writable")
			dataref("Status_Integer5", "bgood/xsaitekpanels/sharedata/integer5", "writable")
			dataref("Status_Integer6", "bgood/xsaitekpanels/sharedata/integer6", "writable")
			dataref("Status_Integer7", "bgood/xsaitekpanels/sharedata/integer7", "writable")
			dataref("Status_Integer8", "bgood/xsaitekpanels/sharedata/integer8", "writable")
			dataref("MULTI_AT_SWITCH","bgood/xsaitekpanels/multipanel/at/status", "readonly")
			dataref("AutoThrottle_Status", "laminar/B738/autopilot/autothrottle_arm_pos", "readonly")
			dataref("MCP_CMD_A_STATUS", "laminar/B738/autopilot/cmd_a_status", "readonly")
			dataref("MCP_CMD_B_STATUS", "laminar/B738/autopilot/cmd_b_status", "readonly")
			dataref("MCP_CWS_A_STATUS", "laminar/B738/autopilot/cws_a_status", "readonly")
			dataref("MCP_CWS_B_STATUS", "laminar/B738/autopilot/cws_b_status", "readonly")
			dataref("MCP_HDGHOLD_STATUS", "laminar/B738/autopilot/hdg_sel_status", "readonly")
			dataref("MCP_HDGBUG_STATUS", "laminar/B738/hud/hdg_bug_tape", "readonly")
			dataref("MCP_LNAV_STATUS", "laminar/B738/autopilot/lnav_status", "readonly")
			dataref("MCP_N1_STATUS", "laminar/B738/autopilot/n1_status", "readonly")
			dataref("MCP_SPEED_STATUS", "laminar/B738/autopilot/speed_status1", "readonly")
			dataref("MCP_LVL_CGH_STATUS", "laminar/B738/autopilot/lvl_chg_status", "readonly")
			dataref("MCP_ALT_HLD_STATUS", "laminar/B738/autopilot/alt_hld_status", "readonly")
			dataref("MCP_VNAV_STATUS", "laminar/B738/autopilot/vnav_status1", "readonly")
			dataref("MCP_VS_STATUS", "laminar/B738/autopilot/vs_status", "readonly")
			dataref("MCP_VV_STATUS", "sim/cockpit/autopilot/vertical_velocity", "readonly")
			dataref("MCP_VORLOC_STATUS", "laminar/B738/autopilot/vorloc_status", "readonly")
			dataref("MCP_APP_STATUS", "laminar/B738/autopilot/app_status", "readonly")
			dataref("MCP_BANK_STATUS", "laminar/B738/autopilot/bank_angle_pos", "readonly")
		end
	end
	do_often("Init_Loop()")

	-- --------------------------------------------------------------------------------
	-- MULTI PANEL BUTTON PRESS
	-- --------------------------------------------------------------------------------

	Button_Table = {}
	function Push_Button(_dataref, on_value, off_value, delay)
		local _on_value = on_value or 1
		local _off_value = off_value or 0
		local _delay = delay or 0.1
		table.insert(Button_Table, {_dataref, _on_value, _off_value, SIM_TIME+_delay})
		set(_dataref, _on_value)
	end
	Command_Table = {}
	function CommandBegin(_dataref, delay)
		local _delay = delay or 0.15
		table.insert(Command_Table, {_dataref, SIM_TIME+_delay})
		command_begin(_dataref)
	end
	function Release_Button()
		if (#Button_Table ~= 0) then
			i = #Button_Table
			if (Button_Table[i][4] < SIM_TIME) then
				set(Button_Table[i][1], Button_Table[i][3])
				table.remove(Button_Table, i)
			end
		else
			if (#Command_Table == 0) then return end
			i = #Command_Table
			if (Command_Table[i][2] < SIM_TIME) then
				command_end(Command_Table[i][1])
				table.remove(Command_Table, i)
			end
		end
	end
	do_every_frame("Release_Button()")

	-- --------------------------------------------------------------------------------
	-- SWITCH PANEL FUNCTIONS
	-- --------------------------------------------------------------------------------
	
	-- Starter autobrakes
	function auto_brake_loop()
		if SwitchPanel == false then return end
		if SWITCH_STARTOFF == 1 and Mag_Switch_Mode == false and Auto_Brake_Setting ~= 1 then
			command_once("laminar/B738/knob/autobrake_rto")
			Auto_Brake_Setting = 1
		end
		if SWITCH_STARTRIGHT == 1 and Mag_Switch_Mode == false and Auto_Brake_Setting ~= 2 then
			command_once("laminar/B738/knob/autobrake_off")
			Auto_Brake_Setting = 2
		end
		if SWITCH_STARTLEFT == 1 and Mag_Switch_Mode == false and Auto_Brake_Setting ~= 3 then
			command_once("laminar/B738/knob/autobrake_1")
			Auto_Brake_Setting = 3
		end
		if SWITCH_STARTBOTH == 1 and Mag_Switch_Mode == false and Auto_Brake_Setting ~= 4 then
			command_once("laminar/B738/knob/autobrake_2")
			Auto_Brake_Setting = 4
		end
		if SWITCH_STARTSTART == 1 and Mag_Switch_Mode == false and Auto_Brake_Setting ~= 5 then
			if FN_BUTTON == 1 then
				AutoBrakesMax = true
			else
				AutoBrakesMax = false
			end
			if AutoBrakesMax == true then
				command_once("laminar/B738/knob/autobrake_max")
			else
				command_once("laminar/B738/knob/autobrake_3")
			end
			
			Auto_Brake_Setting = 5
		end
	end
	do_every_frame("auto_brake_loop()")

	-- --------------------------------------------------------------------------------

	-- Bat
	function Cmd_SP_Bat_On()
		if FN_BUTTON == 0 then
			if Battery_Cover == 1 then
				CommandBegin("laminar/B738/button_switch_cover02")
			end
			Battery_Position = 1
		else
			CommandBegin("laminar/B738/toggle_switch/gpu_dn")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Bat_On", "Cmd_SP_Bat_On", "Cmd_SP_Bat_On()", "", "")
	function Cmd_SP_Bat_Off()
		if FN_BUTTON == 0 then
			if Battery_Cover == 0 then
				CommandBegin("laminar/B738/button_switch_cover02")
			end
			Battery_Position = 0
		else
			CommandBegin("laminar/B738/toggle_switch/gpu_up")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Bat_Off", "Cmd_SP_Bat_Off", "Cmd_SP_Bat_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Alt
	function Cmd_SP_Alt_On()
		CommandBegin("laminar/B738/toggle_switch/gen1_dn")
		CommandBegin("laminar/B738/toggle_switch/gen2_dn")
	end
	create_command("FlyWithLua/B738/Cmd_SP_Alt_On", "Cmd_SP_Alt_On", "Cmd_SP_Alt_On()", "", "")
	function Cmd_SP_Alt_Off()
		if FN_BUTTON == 1 then
			
		else
			CommandBegin("laminar/B738/toggle_switch/gen1_up")
			CommandBegin("laminar/B738/toggle_switch/gen2_up")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Alt_Off", "Cmd_SP_Alt_Off", "Cmd_SP_Alt_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Avionics master
	function Cmd_SP_Avionics()
		if SWITCH_AVIONICS == 1 then
			if ADIRU == true then return end
			if ADIRUSwitchL == 3 then
				command_once("laminar/B738/toggle_switch/irs_L_left")
				return
			end
			if ADIRUSwitchL == 0 then
				command_once("laminar/B738/toggle_switch/irs_L_right")
				return
			end
			if ADIRUSwitchL == 1 then
				command_once("laminar/B738/toggle_switch/irs_L_right")
				return
			end
			if ADIRUSwitchR == 3 then
				command_once("laminar/B738/toggle_switch/irs_R_left")
				ADIRU = true
				return
			end
			if ADIRUSwitchR == 0 then
				command_once("laminar/B738/toggle_switch/irs_R_right")
				return
			end
			if ADIRUSwitchR == 1 then
				command_once("laminar/B738/toggle_switch/irs_R_right")
				ADIRU = true
			end
			if ADIRUSwitchL ~= 0 and ADIRUSwitchR ~= 0 then
				ADIRU = true
			end
		else
			if ADIRU == false then return end
			if ADIRUSwitchR ~= 0 then
				command_once("laminar/B738/toggle_switch/irs_R_left")
				command_once("laminar/B738/toggle_switch/irs_R_left")
				command_once("laminar/B738/toggle_switch/irs_R_left")
				return
			end
			if ADIRUSwitchL ~= 0 then
				command_once("laminar/B738/toggle_switch/irs_L_left")
				command_once("laminar/B738/toggle_switch/irs_L_left")
				command_once("laminar/B738/toggle_switch/irs_L_left")
				ADIRU = false
			end
			if ADIRUSwitchL == 0 and ADIRUSwitchR == 0 then
				ADIRU = false
				return
			end
		end
	end

	-- Avionics master for Honeycomb yoke and throttle quadrant
	function Cmd_SP_Avionics_On()
		Cmd_SP_Avionics_Off()
		command_once("laminar/B738/toggle_switch/irs_L_right")
		command_once("laminar/B738/toggle_switch/irs_L_right")
		command_once("laminar/B738/toggle_switch/irs_R_right")
		command_once("laminar/B738/toggle_switch/irs_R_right")
	end
	create_command("FlyWithLua/B738/Cmd_SP_Avionics_On", "Cmd_SP_Avionics_On", "Cmd_SP_Avionics_On()", "", "")
	function Cmd_SP_Avionics_Off()
		command_once("laminar/B738/toggle_switch/irs_R_left")
		command_once("laminar/B738/toggle_switch/irs_R_left")
		command_once("laminar/B738/toggle_switch/irs_R_left")
		command_once("laminar/B738/toggle_switch/irs_L_left")
		command_once("laminar/B738/toggle_switch/irs_L_left")
		command_once("laminar/B738/toggle_switch/irs_L_left")
	end
	create_command("FlyWithLua/B738/Cmd_SP_Avionics_Off", "Cmd_SP_Avionics_Off", "Cmd_SP_Avionics_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Fuel pump
	function Cmd_SP_FuelPump_On()
		if FN_BUTTON == 0 then
			set("laminar/B738/fuel/fuel_tank_pos_lft1", 1)
			set("laminar/B738/fuel/fuel_tank_pos_lft2", 1)
			set("laminar/B738/fuel/fuel_tank_pos_rgt1", 1)
			set("laminar/B738/fuel/fuel_tank_pos_rgt2", 1)
		else
			set("laminar/B738/fuel/fuel_tank_pos_ctr1", 1)
			set("laminar/B738/fuel/fuel_tank_pos_ctr2", 1)
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_FuelPump_On", "Cmd_SP_FuelPump_On", "Cmd_SP_FuelPump_On()", "", "")
	function Cmd_SP_FuelPump_Off()
		if FN_BUTTON == 0 then
			set("laminar/B738/fuel/fuel_tank_pos_lft1", 0)
			set("laminar/B738/fuel/fuel_tank_pos_lft2", 0)
			set("laminar/B738/fuel/fuel_tank_pos_rgt1", 0)
			set("laminar/B738/fuel/fuel_tank_pos_rgt2", 0)
		else
			set("laminar/B738/fuel/fuel_tank_pos_ctr1", 0)
			set("laminar/B738/fuel/fuel_tank_pos_ctr2", 0)
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_FuelPump_Off", "Cmd_SP_FuelPump_Off", "Cmd_SP_FuelPump_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Deice
	function Cmd_SP_DeIce_On()
		set("laminar/B738/ice/wing_heat_pos", 1)
		set("laminar/B738/ice/eng1_heat_pos", 1)
		set("laminar/B738/ice/eng2_heat_pos", 1)
	end
	create_command("FlyWithLua/B738/Cmd_SP_DeIce_On", "Cmd_SP_DeIce_On", "Cmd_SP_DeIce_On()", "", "")
	function Cmd_SP_DeIce_Off()
		set("laminar/B738/ice/wing_heat_pos", 0)
		set("laminar/B738/ice/eng1_heat_pos", 0)
		set("laminar/B738/ice/eng2_heat_pos", 0)
	end
	create_command("FlyWithLua/B738/Cmd_SP_DeIce_Off", "Cmd_SP_DeIce_Off", "Cmd_SP_DeIce_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Pitot heat
	function Cmd_SP_PitotHeat_On()
		set("laminar/B738/toggle_switch/capt_probes_pos", 1)
		set("laminar/B738/toggle_switch/fo_probes_pos", 1)
		set("laminar/B738/ice/window_heat_l_fwd_pos", 1)
		set("laminar/B738/ice/window_heat_l_side_pos", 1)
		set("laminar/B738/ice/window_heat_r_fwd_pos", 1)
		set("laminar/B738/ice/window_heat_r_side_pos", 1)
	end
	create_command("FlyWithLua/B738/Cmd_SP_PitotHeat_On", "Cmd_SP_PitotHeat_On", "Cmd_SP_PitotHeat_On()", "", "")
	function Cmd_SP_PitotHeat_Off()
		set("laminar/B738/toggle_switch/capt_probes_pos", 0)
		set("laminar/B738/toggle_switch/fo_probes_pos", 0)
		set("laminar/B738/ice/window_heat_l_fwd_pos", 0)
		set("laminar/B738/ice/window_heat_l_side_pos", 0)
		set("laminar/B738/ice/window_heat_r_fwd_pos", 0)
		set("laminar/B738/ice/window_heat_r_side_pos", 0)
	end
	create_command("FlyWithLua/B738/Cmd_SP_PitotHeat_Off", "Cmd_SP_PitotHeat_Off", "Cmd_SP_PitotHeat_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Cowl
	function Cmd_SP_Cowl_On()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/rotary/eng1_start_cont")
			command_once("laminar/B738/rotary/eng2_start_cont")
		else

		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Cowl_On", "Cmd_SP_Cowl_On", "Cmd_SP_Cowl_On()", "", "")
	function Cmd_SP_Cowl_Off()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/rotary/eng1_start_off")
			command_once("laminar/B738/rotary/eng2_start_off")
		else

		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Cowl_Off", "Cmd_SP_Cowl_Off", "Cmd_SP_Cowl_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Panel
	function Cmd_SP_Panel_On()
		if FN_BUTTON == 0 then
			Panel_Brightness0 = .8
			Panel_Brightness1 = .8
			Panel_Brightness2 = .8
			Panel_Brightness3 = .8
			Flood_Brightness6 = .3
			Flood_Brightness7 = .3
			Flood_Brightness8 = .3
			Flood_Brightness10 = .3
			Flood_Brightness11 = .3
			Flood_Brightness12 = .3
		else
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
		end

	end
	create_command("FlyWithLua/B738/Cmd_SP_Panel_On", "Cmd_SP_Panel_On", "Cmd_SP_Panel_On()", "", "")
	function Cmd_SP_Panel_Off()
		if FN_BUTTON == 0 then
			Panel_Brightness0 = 0
			Panel_Brightness1 = 0
			Panel_Brightness2 = 0
			Panel_Brightness3 = 0
			Flood_Brightness6 = 0
			Flood_Brightness7 = 0
			Flood_Brightness8 = 0
			Flood_Brightness10 = 0
			Flood_Brightness11 = 0
			Flood_Brightness12 = 0
		else
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Panel_Off", "Cmd_SP_Panel_Off", "Cmd_SP_Panel_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Beacon
	function Cmd_SP_Beacon_On()
		if FN_BUTTON == 0 then
			command_once("sim/lights/beacon_lights_on")
		else
			command_once("laminar/B738/switch/wheel_light_on")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Beacon_On", "Cmd_SP_Beacon_On", "Cmd_SP_Beacon_On()", "", "")
	function Cmd_SP_Beacon_Off()
		if FN_BUTTON == 0 then
			command_once("sim/lights/beacon_lights_off")
		else
			command_once("laminar/B738/switch/wheel_light_off")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Beacon_Off", "Cmd_SP_Beacon_Off", "Cmd_SP_Beacon_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Nav
	function Cmd_SP_Nav_On()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/switch/logo_light_on")
		else
			command_once("laminar/B738/switch/wing_light_on")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Nav_On", "Cmd_SP_Nav_On", "Cmd_SP_Nav_On()", "", "")
	function Cmd_SP_Nav_Off()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/switch/logo_light_off")
			command_once("laminar/B738/switch/wing_light_off")
		else
			command_once("laminar/B738/switch/wing_light_off")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Nav_Off", "Cmd_SP_Nav_Off", "Cmd_SP_Nav_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Strobe
	function Cmd_SP_Strobe_On()
		if FN_BUTTON == 0 then
			if PLANE_ICAO == "B737" or "B739" then
				command_once("laminar/B738/toggle_switch/position_light_up")
				command_once("laminar/B738/toggle_switch/position_light_up")
			else
				command_once("laminar/B738/toggle_switch/position_light_strobe")
			end
		else
			if PLANE_ICAO == "B737" or "B739" then
				command_once("laminar/B738/toggle_switch/position_light_down")
				command_once("laminar/B738/toggle_switch/position_light_down")
			else
				command_once("laminar/B738/toggle_switch/position_light_steady")
			end
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Strobe_On", "Cmd_SP_Strobe_On", "Cmd_SP_Strobe_On()", "", "")
	function Cmd_SP_Strobe_Off()
		if PLANE_ICAO == "B737" or "B739" then
			command_once("laminar/B738/toggle_switch/position_light_up")
			command_once("laminar/B738/toggle_switch/position_light_up")
			command_once("laminar/B738/toggle_switch/position_light_down")
		else
			command_once("laminar/B738/toggle_switch/position_light_off")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Strobe_Off", "Cmd_SP_Strobe_Off", "Cmd_SP_Strobe_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Taxi
	function Cmd_SP_Taxi_On()
		if FN_BUTTON == 0 then
			if PLANE_ICAO == "B737" or "B739" then
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_dn")
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_dn")
			else
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_on")
			end
			command_once("laminar/B738/switch/rwy_light_left_on")
			command_once("laminar/B738/switch/rwy_light_right_on")
		else
			if PLANE_ICAO == "B737" or "B739" then
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_dn")
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_dn")
			else
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_on")
			end
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Taxi_On", "Cmd_SP_Taxi_On", "Cmd_SP_Taxi_On()", "", "")
	function Cmd_SP_Taxi_Off()
		if FN_BUTTON == 0 then
			if PLANE_ICAO == "B737" or "B739" then
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_up")
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_up")
			else
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_off")
			end
			command_once("laminar/B738/switch/rwy_light_left_off")
			command_once("laminar/B738/switch/rwy_light_right_off")
		else
			if PLANE_ICAO == "B737" or "B739" then
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_up")
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_up")
			else
				command_once("laminar/B738/toggle_switch/taxi_light_brightness_off")
			end
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Taxi_Off", "Cmd_SP_Taxi_Off", "Cmd_SP_Taxi_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Landing
	function Cmd_SP_Landing_On()
		if PLANE_ICAO == "B737" then
			command_once("laminar/B738/spring_switch/landing_lights_all")
		else
			command_once("sim/lights/landing_lights_on")
		end
		if FN_BUTTON == 1 then
			
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Landing_On", "Cmd_SP_Landing_On", "Cmd_SP_Landing_On()", "", "")
	function Cmd_SP_Landing_Off()
		if PLANE_ICAO == "B737" then
			set("laminar/B738/switch/land_lights_left_pos",0)
			set("laminar/B738/switch/land_lights_right_pos",0)
		else
			command_once("sim/lights/landing_lights_off")
		end
		if FN_BUTTON == 1 then
			
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Landing_Off", "Cmd_SP_Landing_Off", "Cmd_SP_Landing_Off()", "", "")

	-- --------------------------------------------------------------------------------

	-- Gear
	function Cmd_SP_Gear_Dn()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/push_button/gear_down")
		else
			command_once("laminar/B738/push_button/gear_off")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Gear_Dn", "Cmd_SP_Gear_Dn", "Cmd_SP_Gear_Dn()", "", "")
	function Cmd_SP_Gear_Up()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/push_button/gear_up")
		end
	end
	create_command("FlyWithLua/B738/Cmd_SP_Gear_Up", "Cmd_SP_Gear_Up", "Cmd_SP_Gear_Up()", "", "")


	-- --------------------------------------------------------------------------------
	-- HONEY COMB FUNCTIONS
	-- --------------------------------------------------------------------------------

	function Cmd_HC_Wxr()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/EFIS_control/capt/push_button/wxr_press")
		else
			command_once("laminar/B738/EFIS_control/capt/push_button/fpv_press")
		end
	end
	create_command("FlyWithLua/B738/Cmd_HC_Wxr", "Cmd_HC_Wxr", "Cmd_HC_Wxr()", "", "")

	function Cmd_HC_EFIS()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/EFIS_control/capt/push_button/sta_press")
			command_once("laminar/B738/EFIS_control/capt/push_button/arpt_press")
			command_once("laminar/B738/EFIS_control/capt/push_button/data_press")
			command_once("laminar/B738/EFIS_control/capt/push_button/terr_press")
			command_once("laminar/B738/EFIS_control/fo/push_button/sta_press")
			command_once("laminar/B738/EFIS_control/fo/push_button/arpt_press")
			command_once("laminar/B738/EFIS_control/fo/push_button/data_press")
			command_once("laminar/B738/EFIS_control/fo/push_button/terr_press")
		else
			command_once("laminar/B738/EFIS_control/capt/push_button/terr_press")
		end
	end
	create_command("FlyWithLua/B738/Cmd_HC_EFIS", "Cmd_HC_EFIS", "Cmd_HC_EFIS()", "", "")


	
	-- --------------------------------------------------------------------------------
	-- OTHER FUNCTIONS
	-- --------------------------------------------------------------------------------

	function Cmd_OT_ATTEND()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/toggle_switch/fire_test_rgt")
			command_end("laminar/B738/toggle_switch/fire_test_rgt
			command_once("laminar/B738/push_button/cargo_fire_test_push")
			command_once("laminar/B738/EFIS_control/capt/push_button/arpt_press")
		else
			command_once("laminar/B738/push_button/grd_call")
		end
	end
	create_command("FlyWithLua/B738/Cmd_OT_ATTEND", "Cmd_OT_ATTEND", "Cmd_OT_ATTEND()", "", "")

	function Cmd_APUStart_Pos()
		command_once("laminar/B738/spring_toggle_switch/APU_start_pos_dn")
		command_once("laminar/B738/spring_toggle_switch/APU_start_pos_dn")
		command_once("laminar/B738/spring_toggle_switch/APU_start_pos_dn")
	end
	create_command("FlyWithLua/B738/Cmd_APUStart_Pos", "Cmd_APUStart_Pos", "Cmd_APUStart_Pos()", "", "")
	

	-- --------------------------------------------------------------------------------
	-- RADIO PANEL FUNCTIONS
	-- --------------------------------------------------------------------------------

	function Cmd_RP_Barometer_Up()
		command_once("laminar/B738/pilot/barometer_up")
		command_once("laminar/B738/copilot/barometer_up")
	end
	create_command("FlyWithLua/B738/Cmd_RP_Barometer_Up", "Cmd_RP_Barometer_Up", "Cmd_RP_Barometer_Up()", "", "")

	function Cmd_RP_Barometer_Dn()
		command_once("laminar/B738/pilot/barometer_down")
		command_once("laminar/B738/copilot/barometer_down")
	end
	create_command("FlyWithLua/B738/Cmd_RP_Barometer_Dn", "Cmd_RP_Barometer_Dn", "Cmd_RP_Barometer_Dn()", "", "")

	function Cmd_RP_STD()
		command_once("laminar/B738/EFIS_control/capt/push_button/std_press")
		command_once("laminar/B738/EFIS_control/fo/push_button/std_press")
	end
	create_command("FlyWithLua/B738/Cmd_RP_STD", "Cmd_RP_STD", "Cmd_RP_STD()", "", "")

	function Cmd_RP_Course_Up()
		command_once("laminar/B738/autopilot/course_pilot_up")
		command_once("laminar/B738/autopilot/course_copilot_up")
	end
	create_command("FlyWithLua/B738/Cmd_RP_Course_Up", "Cmd_RP_Course_Up", "Cmd_RP_Course_Up()", "", "")

	function Cmd_RP_Course_Dn()
		command_once("laminar/B738/autopilot/course_pilot_dn")
		command_once("laminar/B738/autopilot/course_copilot_dn")
	end
	create_command("FlyWithLua/B738/Cmd_RP_Course_Dn", "Cmd_RP_Course_Dn", "Cmd_RP_Course_Dn()", "", "")

	function Cmd_RP_DH_Up()
		command_once("laminar/B738/pfd/dh_pilot_up")
		command_once("laminar/B738/pfd/dh_copilot_up")
	end
	create_command("FlyWithLua/B738/Cmd_RP_DH_Up", "Cmd_RP_DH_Up", "Cmd_RP_DH_Up()", "", "")

	function Cmd_RP_DH_Dn()
		command_once("laminar/B738/pfd/dh_pilot_dn")
		command_once("laminar/B738/pfd/dh_copilot_dn")
	end
	create_command("FlyWithLua/B738/Cmd_RP_DH_Dn", "Cmd_RP_DH_Dn", "Cmd_RP_DH_Dn()", "", "")

	-- --------------------------------------------------------------------------------
	-- MULTI PANEL FUNCTIONS
	-- --------------------------------------------------------------------------------

	-- AP
	function Cmd_MP_AP()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/autopilot/cmd_a_press")
		else
			CommandBegin("laminar/B738/autopilot/cmd_b_press")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_AP", "Cmd_MP_AP", "Cmd_MP_AP()", "", "")

	-- --------------------------------------------------------------------------------

	-- HDG
	function Cmd_MP_HDG()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/autopilot/hdg_sel_press")
		else
			command_once("sim/autopilot/heading_sync")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_HDG", "Cmd_MP_HDG", "Cmd_MP_HDG()", "", "")

	-- --------------------------------------------------------------------------------

	-- NAV
	function Cmd_MP_NAV()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/autopilot/lnav_press")
		else
			command_once("laminar/B738/autopilot/bank_angle_up")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_NAV", "Cmd_MP_NAV", "Cmd_MP_NAV()", "", "")

	-- --------------------------------------------------------------------------------

	-- IAS
	function Cmd_MP_IAS()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/autopilot/speed_press")
		else
			CommandBegin("laminar/B738/autopilot/spd_interv")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_IAS", "Cmd_MP_IAS", "Cmd_MP_IAS()", "", "")

	-- --------------------------------------------------------------------------------

	-- ALT
	function Cmd_MP_ALT()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/autopilot/alt_hld_press")
		else
			CommandBegin("laminar/B738/autopilot/alt_interv")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_ALT", "Cmd_MP_ALT", "Cmd_MP_ALT()", "", "")

	-- --------------------------------------------------------------------------------

	-- VS
	function Cmd_MP_VS()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/autopilot/vs_press")
		else
			command_once("sim/autopilot/vertical_speed_sync")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_VS", "Cmd_MP_VS", "Cmd_MP_VS()", "", "")

	-- --------------------------------------------------------------------------------

	-- APR
	function Cmd_MP_APR()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/autopilot/app_press")
		else
			CommandBegin("laminar/B738/autopilot/vorloc_press")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_APR", "Cmd_MP_APR", "Cmd_MP_APR()", "", "")

	-- --------------------------------------------------------------------------------

	-- REV
	function Cmd_MP_REV()
		if FN_BUTTON == 0 then
			CommandBegin("laminar/B738/autopilot/vnav_press")
		else
			command_once("laminar/B738/autopilot/bank_angle_dn")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_REV", "Cmd_MP_REV", "Cmd_MP_REV()", "", "")

	-- --------------------------------------------------------------------------------

	-- Flaps
	function Cmd_MP_Flaps_Dn()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/toggle_switch/seatbelt_sign_dn")
		else
			command_once("laminar/B738/toggle_switch/no_smoking_dn")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_Flaps_Dn", "Cmd_MP_Flaps_Dn", "Cmd_MP_Flaps_Dn()", "", "")
	function Cmd_MP_Flaps_Up()
		if FN_BUTTON == 0 then
			command_once("laminar/B738/toggle_switch/seatbelt_sign_up")
		else
			command_once("laminar/B738/toggle_switch/no_smoking_up")
		end
	end
	create_command("FlyWithLua/B738/Cmd_MP_Flaps_Up", "Cmd_MP_Flaps_Up", "Cmd_MP_Flaps_Up()", "", "")

	-- --------------------------------------------------------------------------------

	-- Trim
	function Cmd_MP_Trim_Dn()
		CommandBegin("sim/autopilot/vertical_speed_down")
	end
	create_command("FlyWithLua/B738/Cmd_MP_Trim_Dn", "Cmd_MP_Trim_Dn", "Cmd_MP_Trim_Dn()", "", "")
	function Cmd_MP_Trim_Up()
		CommandBegin("sim/autopilot/vertical_speed_up")
	end
	create_command("FlyWithLua/B738/Cmd_MP_Trim_Up", "Cmd_MP_Trim_Up", "Cmd_MP_Trim_Up()", "", "")

	-- --------------------------------------------------------------------------------
	-- REFRESH MULTI PANEL LIGHTS
	-- --------------------------------------------------------------------------------

	function RefreshLights()
		if RadioPanel then
			if XPDR_STATUS_UP == 1 then
				if XPDR_CRS_INC_UP == 1 and FN_BUTTON == 0 then
					if CAP_FO_QNH == true then
						command_once("laminar/B738/EFIS_control/capt/baro_in_hpa_up")
					else
						command_once("laminar/B738/EFIS_control/fo/baro_in_hpa_up")
					end
				end
				if XPDR_CRS_DEC_UP == 1 and FN_BUTTON == 0 then
					if CAP_FO_QNH == true then
						command_once("laminar/B738/EFIS_control/capt/baro_in_hpa_dn")
					else
						command_once("laminar/B738/EFIS_control/fo/baro_in_hpa_dn")
					end
				end
				if ACTSTBY_STATUS_UP == 1 then
					if XPDR_Delay < SIM_TIME then
						XPDR_Delay = SIM_TIME + 0.25
						if FN_BUTTON == 0 then
							CAP_FO_QNH = not CAP_FO_QNH
							if CAP_FO_QNH == true then
								XPLMSpeakString("Captain.")
							else
								XPLMSpeakString("First Officer.")
							end
						else
							if CAP_FO_QNH == true then
								CommandBegin("laminar/B738/EFIS_control/capt/push_button/std_press")
							else
								CommandBegin("laminar/B738/EFIS_control/fo/push_button/std_press")
							end
						end
					end
				end
			end
		end

		if MultiPanel then

			-- AP
			if MCP_CMD_A_STATUS == 1 or MCP_CMD_B_STATUS == 1 then
				Status_Integer1 = 2
			elseif MCP_CWS_A_STATUS == 1 or MCP_CWS_B_STATUS == 1 then
				Status_Integer1 = 1
			else
				Status_Integer1 = 0
			end

			-- HDG
			if MCP_HDGHOLD_STATUS == 0 then
				Status_Integer2 = 0
			elseif MCP_HDGBUG_STATUS > .5 or MCP_HDGBUG_STATUS < -.5 then
				Status_Integer2 = 1
			else
				Status_Integer2 = 2
			end

			-- NAV
			if MCP_LNAV_STATUS == 1 then
				Status_Integer3 = 2
			else
				Status_Integer3 = 0
			end

			if MCP_SPEED_STATUS == 1 then
				Status_Integer4 = 2
			elseif MCP_N1_STATUS == 1 then
				Status_Integer4 = 1
			else
				Status_Integer4 = 0
			end

			-- ALT
			if MCP_ALT_HLD_STATUS == 1 then
				Status_Integer5 = 2
			elseif MCP_LVL_CGH_STATUS == 1 then
				Status_Integer5 = 1
			else
				Status_Integer5 = 0
			end

			-- VS
			if MCP_VS_STATUS == 0 then
				Status_Integer6 = 0
			elseif MCP_VV_STATUS ~= 0 then
				Status_Integer6 = 1
			else
				Status_Integer6 = 2
			end

			-- APP
			if MCP_VORLOC_STATUS == 0 and MCP_APP_STATUS == 1 then
				Status_Integer7 = 2
			elseif MCP_VORLOC_STATUS == 1 and MCP_APP_STATUS == 0 then
				Status_Integer7 = 1
			else
				Status_Integer7 = 0
			end

			-- REV
			if MCP_VNAV_STATUS == 1 then
				Status_Integer8 = 2
			else
				Status_Integer8 = 0
			end

			-- AT
			if MULTI_AT_SWITCH == 1 and AutoThrottle_Status == 0 and AuthoThrottleOn == false then
				command_once("laminar/B738/autopilot/autothrottle_arm_toggle")
				AuthoThrottleOn = true
			elseif	MULTI_AT_SWITCH == 0 and AutoThrottle_Status == 1 and AuthoThrottleOn == true then
				command_once("laminar/B738/autopilot/autothrottle_arm_toggle")
				AuthoThrottleOn = false
			end
			if MULTI_AT_SWITCH == 1 then
				AuthoThrottleOn = true
			elseif	MULTI_AT_SWITCH == 0 then
				AuthoThrottleOn = false
			end
		end
	end
	do_every_frame("RefreshLights()")

	-- --------------------------------------------------------------------------------
	-- TIMED MESSAGE WITH ANY KEY EXIT
	-- --------------------------------------------------------------------------------

	local function YesNo_String(value)
		return value == true and "Yes" or value == false and "No"
	end
	local function status_message()
		local boxWidth = 323;
		local boxHeight = 163;
		local ypos = 30
		local xpos = 30
		graphics.set_color(0.0, 0.0, 0.8, 0.4);
		graphics.draw_rectangle(xpos, ypos, xpos+boxWidth, ypos+boxHeight)
		graphics.set_color(1.0, 1.0, 1.0, 1.0);
		draw_string_Helvetica_18(xpos + 10, ypos + boxHeight - 25, Script_Title.." ver. "..Script_Version)
		graphics.set_color(0.0, 1.0, 0.0, 1.0);
		draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 41, "Message expires in: "..Msg_Timer.." seconds or press space.")
		graphics.set_color(1.0, 1.0, 0.0, 1.0);
		draw_string_Helvetica_10(xpos + 10, ypos + boxHeight - 57, "NOTE: XPlane Plugin1.2.6.0 conflicts with xsaitek scripts so it")
		draw_string_Helvetica_10(xpos + 10, ypos + boxHeight - 72, "will be disabled if it exists, but will be reenabled on exit.")
		graphics.set_color(1.0, 1.0, 1.0, 1.0);
		draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 89, "Plane ICAO: "..PLANE_ICAO)
		draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 104, "Switch Panel: "..YesNo_String(SwitchPanel))
		draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 119, "Multi Panel: "..YesNo_String(MultiPanel))
		draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 134, "Radio Panel: "..YesNo_String(RadioPanel))
		draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 149, "XPlane Plugin: "..XPlanePluginID.."")
	end

	function draw_loop()
		key_pressed()
		if End_Time < os.time() then
		Msg_Timer = Msg_Timer -1
		End_Time = os.time()
		end
		if Msg_Timer > 0 then
			status_message()
		end
	end
	do_every_draw("draw_loop()")

	function key_pressed()
		if KEY_ACTION == "pressed" then
			Msg_Timer = 0
		end
	end
	do_on_keystroke("key_pressed()")

	function help_message()
		if Help_Menu == 1 then
			local boxWidth = 330;
			local boxHeight = 739;
			local lineHeight = 16
			local ypos = 30
			local xpos = 30
			graphics.set_color(0.0, 0.0, 0.0, 0.3);
			graphics.draw_rectangle(xpos, ypos, xpos+boxWidth, ypos+boxHeight)
			graphics.set_color(1.0, 1.0, 0.0, 1.0);
			draw_string_Helvetica_18(xpos+12, ypos+boxHeight-25, "-- Help Menu --")
			graphics.set_color(0.0, 1.0, 0.0, 1.0);
			draw_string_Helvetica_10(xpos+12, ypos+boxHeight-44, "Hold your assigned FN button and press one of the following keys")
			draw_string_Helvetica_10(xpos+12, ypos+boxHeight-58, "This menu does not need to be displayed to select these options")
			graphics.set_color(1.0, 1.0, 1.0, 1.0);
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-5*lineHeight, "1.   (Space) = Take Screenshot")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-6*lineHeight, "2.   (<) = Previous livery")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-7*lineHeight, "3.   (>) = Next livery (Takes a few seconds to load)")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-8*lineHeight, "4.   (-) = Decrease AviTab brightness")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-9*lineHeight, "5.   (+) = Increase AviTab brightness")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-10*lineHeight, "6.   (a) = Autobrake to Engine start mode toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-11*lineHeight, "7.   (A) = Avitab tablet home page toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-12*lineHeight, "8.   (b) = Toggle Logitech Saitek driver")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-13*lineHeight, "9.   (c) = Custom location window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-14*lineHeight, "10.  (C) = Configure video recording window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-15*lineHeight, "11.  (d) = Device console toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-16*lineHeight, "12.  (D) = DataRefTool (if installed)")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-17*lineHeight, "13.  (e) = White flashlight under mouse pointer")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-18*lineHeight, "14.  (E) = Red flashlight under mouse pointer")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-19*lineHeight, "15.  (f)  = Show frames per second")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-20*lineHeight, "16.  (F) = Failures window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-21*lineHeight, "17.  (g) = Data output graph window toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-22*lineHeight, "18.  (G) = Garmin 430 popout toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-23*lineHeight, "19.  (j)  = Joystick profiles window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-24*lineHeight, "20.  (k) = Keyboard shortcuts window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-25*lineHeight, "21.  (l)  = Load aircraft window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-26*lineHeight, "22.  (L) = Load flight window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-27*lineHeight, "23.  (m) = Main menu window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-28*lineHeight, "24.  (M) = Microprofile toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-29*lineHeight, "25.  (n) = Night vision toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-30*lineHeight, "26.  (o) = Wear Sunglasses toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-31*lineHeight, "27.  (p) = Pilot logbook toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-32*lineHeight, "28.  (P) = Projection window toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-33*lineHeight, "29.  (q) = Quit X-Plane")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-34*lineHeight, "30.  (r)  = Replay mode toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-35*lineHeight, "31.  (R) = Request ground service toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-36*lineHeight, "32.  (s) = Settings window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-37*lineHeight, "33.  (S) = Scenery reload")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-38*lineHeight, "34.  (t) = Training (Flight school)")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-39*lineHeight, "35.  (T) = Traffic paths toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-40*lineHeight, "36.  (v) = Video recording toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-41*lineHeight, "37.  (V) = VRAM profiler toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-42*lineHeight, "38.  (w) = Weight and balance window")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-43*lineHeight, "39.  (x) = X-Plane Plugin admin toggle")
			draw_string_Helvetica_12(xpos+12, ypos+boxHeight-44*lineHeight, "40.  (?) = Toggle this help menu.")
			graphics.set_color(0.0, 1.0, 1.0, 1.0);
			draw_string_Helvetica_12(xpos+11, ypos+boxHeight-724, "(Use Capslock or shift for upper case characters)")
		end
	end
	do_every_draw("help_message()")

	function menu_key()
		if FN_BUTTON == 1 then
			if KEY_ACTION == "pressed" then
				RESUME_KEY = true
				if CKEY == " " then
					command_once("sim/operation/screenshot")
				elseif	CKEY == "." then
					command_once("sim/operation/next_livery")
				elseif	CKEY == "," then
					command_once("sim/operation/prev_livery")
				elseif	CKEY == "-" then
					Avi_Brightness = Avi_Brightness - .1
					if Avi_Brightness < .1 then
						Avi_Brightness = 0
					end
				elseif	CKEY == "=" or CKEY == "+" then
					Avi_Brightness = Avi_Brightness + .1
					if Avi_Brightness > .9 then
						Avi_Brightness = 1
					end
				elseif	CKEY == "a" then
					if SwitchPanel == false then
						XPLMSpeakString("Switch panel is required.")
					else
						Mag_Switch_Mode = not Mag_Switch_Mode
						if Mag_Switch_Mode == false then
							XPLMSpeakString("Auto brake mode.")
						else
							XPLMSpeakString("Engine start mode.")
						end
					end
				elseif	CKEY == "A" then
					command_once("AviTab/toggle_tablet")
					command_once("AviTab/Home")
				elseif	CKEY == "b" then
					local sig_return = XPLM.XPLMFindPluginBySignature(plugin_Signature)
					if (sig_return > 0) then
						if PluginStatus == 1 then
							XPLM.XPLMDisablePlugin(sig_return)
							XPLMSpeakString("Disabled")
							PluginStatus = 0
						else
							XPLM.XPLMEnablePlugin(sig_return)
							XPLMSpeakString("Enabled")
							PluginStatus = 1
						end
					end
				elseif	CKEY == "c" then
					command_once("sim/operation/toggle_custom_location_window")
				elseif	CKEY == "C" then
					command_once("sim/operation/configure_video_recording")
				elseif	CKEY == "d" then
					command_once("sim/operation/dev_console")
				elseif	CKEY == "D" then
					command_once("leecbaker/datareftool/new_search_window")
				elseif	CKEY == "e" then
					command_once("sim/view/flashlight_wht")
				elseif	CKEY == "E" then
					command_once("sim/view/flashlight_red")
				elseif	CKEY == "f" then
					command_once("sim/operation/show_fps")
				elseif	CKEY == "F" then
					command_once("sim/operation/open_failures_window")
				elseif	CKEY == "g" then
					command_once("sim/operation/toggle_data_output_graph")
				elseif	CKEY == "G" then
					command_once("sim/FMS/CDU_popup")
				elseif	CKEY == "j" then
					command_once("sim/operation/toggle_joy_profiles_window")
				elseif	CKEY == "k" then
					command_once("sim/operation/toggle_key_shortcuts_window")
				elseif	CKEY == "l" then
					command_once("sim/operation/load_aircraft")
				elseif	CKEY == "L" then
					command_once("sim/operation/load_flight")
				elseif	CKEY == "m" then
					command_once("sim/operation/toggle_main_menu")
				elseif	CKEY == "M" then
					command_once("sim/developer/toggle_microprofiler")
				elseif	CKEY == "n" then
					command_once("sim/view/night_vision_toggle")
				elseif	CKEY == "o" then
					command_once("sim/view/sunglasses")
				elseif	CKEY == "p" then
					command_once("sim/operation/toggle_logbook")
				elseif	CKEY == "P" then
					command_once("sim/general/toggle_projection_win")
				elseif	CKEY == "q" then
					command_once("sim/operation/quit")
				elseif	CKEY == "r" then
					command_once("sim/operation/replay_toggle")
				elseif	CKEY == "R" then
					command_once("sim/ground_ops/toggle_window")
				elseif	CKEY == "s" then
					command_once("sim/operation/toggle_settings_window")
				elseif	CKEY == "S" then
					command_once("sim/operation/reload_scenery")
				elseif	CKEY == "t" then
					command_once("sim/operation/toggle_flight_school_window")
				elseif	CKEY == "T" then
					command_once("sim/general/toggle_traffic_paths")
				elseif	CKEY == "v" then
					command_once("sim/operation/video_record_toggle")
				elseif	CKEY == "V" then
					command_once("sim/developer/toggle_vram_profiler")
				elseif	CKEY == "w" then
					command_once("sim/operation/open_weight_and_balance_window")
				elseif	CKEY == "x" then
					command_once("sim/developer/toggle_plugin_admin")
				elseif	CKEY == "/" or CKEY == "?" or CKEY == "h" then
					Help_Menu = 1 - Help_Menu
				end
			end
		end
	end
	do_on_keystroke("menu_key()")

	-- --------------------------------------------------------------------------------
	-- on exit re-enable conflicting saitek plugin by signature and ID
	-- --------------------------------------------------------------------------------

	do_on_exit("Enable_Plugin()")
	function Enable_Plugin()
	-- find plugin ID based on Signature
		local sig_return = XPLM.XPLMFindPluginBySignature(plugin_Signature)
		if (sig_return > 0) then
			logMsg("FlyWithLua Info: ** Plugin '" .. plugin_Signature .. "' found via Signature, ID = " .. sig_return .. ": Renabling Saitek plugin")
	-- disable plugin by ID
			XPLM.XPLMEnablePlugin(sig_return)
		else
			logMsg("FlyWithLua Info: ** Plugin '" .. plugin_Signature .. "' not found via Signature. Saitek plugin was not loaded so nothing to renable")
		end
	end
end
