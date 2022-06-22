--[[
	Zibo Boeing 737-800
	Version: 1.13
	Source: https://github.com/daniol/xsaitekpanels-zibo
--]]
if PLANE_ICAO == "B738" then
    
    local function sleep(n)
        local t0 = os.clock()
        while os.clock() - t0 <= n do end
    end
    
	-- ************************************************************************************************************************************************************************************************
	-- GLOBAL VARIABLES
	AceXSP_Version = "1.13"
	
	-- [Ticket 1] Minimum fuel: 453 kg + 90 kg zibo internal tolerance
	AceXSP_Zibo_FuelCenterMin = 543.0
	
	-- Global datarefs
	dataref("XSP_FNBUTTON", "bgood/xsaitekpanels/fnbutton/status", "readonly")
	
	-- Environmental datarefs
	dataref("WEATHER_VISIBILITY", "sim/weather/visibility_reported_m", "readonly")
	dataref("WEATHER_CLOUD_TYPE", "sim/weather/cloud_type[0]", "readonly")
	dataref("WEATHER_CLOUD_ALT", "sim/weather/cloud_base_msl_m[0]", "readonly")
	dataref("WEATHER_LIGHT", "sim/graphics/misc/light_attenuation", "readonly")
	
	-- Switch datarefs
	dataref("ZIBO_AUTOBRAKE_POS", "laminar/B738/autobrake/autobrake_pos", "readonly")
	dataref("ZIBO_IRS_LEFT", "laminar/B738/toggle_switch/irs_left", "readonly")
	dataref("ZIBO_IRS_RIGHT", "laminar/B738/toggle_switch/irs_right", "readonly")
	dataref("ZIBO_FUEL_LEFT1", "laminar/B738/fuel/fuel_tank_pos_lft1", "readonly")
	dataref("ZIBO_FUEL_LEFT2", "laminar/B738/fuel/fuel_tank_pos_lft2", "readonly")
	dataref("ZIBO_FUEL_RIGHT1", "laminar/B738/fuel/fuel_tank_pos_rgt1", "readonly")
	dataref("ZIBO_FUEL_RIGHT2", "laminar/B738/fuel/fuel_tank_pos_rgt2", "readonly")
	dataref("ZIBO_FUEL_CENTER1", "laminar/B738/fuel/fuel_tank_pos_ctr1", "readonly")
	dataref("ZIBO_FUEL_CENTER2", "laminar/B738/fuel/fuel_tank_pos_ctr2", "readonly")
	dataref("ZIBO_BAT_COVER_POSITION", "laminar/B738/button_switch/cover_position", "readonly", 2)
	dataref("ZIBO_FUEL_CENTER_QTY", "sim/flightmodel/weight/m_fuel2", "readonly")
	dataref("ZIBO_ON_GROUND", "sim/flightmodel2/gear/on_ground", "readonly", 0)
	dataref("ZIBO_PACK_LEFT", "laminar/B738/air/l_pack_pos", "readonly")
	dataref("ZIBO_PACK_RIGHT", "laminar/B738/air/r_pack_pos", "readonly")
		
	-- ************************************************************************************************************************************************************************************************
	-- PROGRAM START

	logMsg ( "AceXSP: ** Starting AceXSP_Zibo738X SWITCHPANEL version "..AceXSP_Version.." **" )
	
	-- ************************************************************************************************************************************************************************************************
	-- HELPER FUNCTIONS
	
	local function AceXSP_Visib_Good()
		-- Typically an RVR (runway visual range) below 550 meters or a cloud base below 200 ft aal will trigger LVPs (low visibility procedures)
		-- Source: https://www.skybrary.aero/index.php/Low_Visibility_Procedures_(LVP)#Aerodromes
		-- Darkness: > 0.5 means low (afternoon/night/dawn)
		
		if ( WEATHER_VISIBILITY > 0 and WEATHER_VISIBILITY < 550 ) or
		   ( WEATHER_CLOUD_TYPE ~= 0 and (WEATHER_CLOUD_ALT - ELEVATION) < 200 ) or
		   ( WEATHER_LIGHT > 0.5 ) then
			return false
		end
	
		-- Otherwhise visib. OK
		return true
	end
		
	-- ************************************************************************************************************************************************************************************************
	-- SWITCHPANEL COMMANDS
	
	-- Starter - Autobrake
	function AceXSP_Switch_Starter_Off()					-- RTO
		if (ZIBO_AUTOBRAKE_POS ~= 0) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_Off", "Switch_Starter_Off", "AceXSP_Switch_Starter_Off()", "", "")
	function AceXSP_Switch_Starter_R()						-- OFF
		if (ZIBO_AUTOBRAKE_POS ~= 1) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_R", "Switch_Starter_R", "AceXSP_Switch_Starter_R()", "", "")
	function AceXSP_Switch_Starter_L()						-- 1
		if (ZIBO_AUTOBRAKE_POS ~= 2) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_L", "Switch_Starter_L", "AceXSP_Switch_Starter_L()", "", "")
	function AceXSP_Switch_Starter_Both()					-- 2
		if (ZIBO_AUTOBRAKE_POS ~= 3) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_Both", "Switch_Starter_Both", "AceXSP_Switch_Starter_Both()", "", "")
	function AceXSP_Switch_Starter_Start()					-- 3
		if (ZIBO_AUTOBRAKE_POS ~= 4) then
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_dn")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
			command_once("laminar/B738/knob/autobrake_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Starter_Start", "Switch_Starter_Start", "AceXSP_Switch_Starter_Start()", "", "")

	function AceXSP_Switch_Bat_On()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/switch/battery_dn")
                        
			if ZIBO_BAT_COVER_POSITION == 1 then
				command_once("laminar/B738/button_switch_cover02")
			end
		else
			command_once("laminar/B738/toggle_switch/gpu_dn")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Bat_On", "Switch_Bat_On", "AceXSP_Switch_Bat_On()", "", "")

	function AceXSP_Switch_Bat_Off()
		if XSP_FNBUTTON == 0 then
			if ZIBO_BAT_COVER_POSITION == 0 then
				command_once("laminar/B738/button_switch_cover02")
				sleep(0.1)
			end
			command_once("laminar/B738/switch/battery_up")
		else
			command_once("laminar/B738/toggle_switch/gpu_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Bat_Off", "Switch_Bat_Off", "AceXSP_Switch_Bat_Off()", "", "")

	function AceXSP_Switch_Alt_On()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/toggle_switch/gen1_dn")
			command_once("laminar/B738/toggle_switch/gen2_dn")
		else
			command_once("laminar/B738/toggle_switch/apu_gen1_dn")
			command_once("laminar/B738/toggle_switch/apu_gen2_dn")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Alt_On", "Switch_Alt_On", "AceXSP_Switch_Alt_On()", "", "")

	function AceXSP_Switch_Alt_Off()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/toggle_switch/gen1_up")
			command_once("laminar/B738/toggle_switch/gen2_up")
		else
			command_once("laminar/B738/toggle_switch/apu_gen1_up")
			command_once("laminar/B738/toggle_switch/apu_gen2_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Alt_Off", "Switch_Alt_Off", "AceXSP_Switch_Alt_Off()", "", "")

	function AceXSP_Switch_Avionics_On()
		if (ZIBO_IRS_LEFT ~= 2) or (ZIBO_IRS_RIGHT ~= 2) then
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_L_right")
			command_once("laminar/B738/toggle_switch/irs_L_right")
			command_once("laminar/B738/toggle_switch/irs_R_right")
			command_once("laminar/B738/toggle_switch/irs_R_right")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Avionics_On", "Switch_Avionics_On", "AceXSP_Switch_Avionics_On()", "", "")
	function AceXSP_Switch_Avionics_Off()
		if (ZIBO_IRS_LEFT ~= 0) or (ZIBO_IRS_RIGHT ~= 0) then
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_L_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
			command_once("laminar/B738/toggle_switch/irs_R_left")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Avionics_Off", "Switch_Avionics_Off", "AceXSP_Switch_Avionics_Off()", "", "")

	function AceXSP_Switch_Fuel_On()
		if XSP_FNBUTTON == 0 then
			if ZIBO_FUEL_LEFT1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_lft1") end
			if ZIBO_FUEL_LEFT2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_lft2") end
			if ZIBO_FUEL_RIGHT1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt1") end
			if ZIBO_FUEL_RIGHT2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt2") end
			if ZIBO_FUEL_CENTER1 ~= 1 and ZIBO_FUEL_CENTER_QTY >= AceXSP_Zibo_FuelCenterMin then command_once("laminar/B738/toggle_switch/fuel_pump_ctr1") end
			if ZIBO_FUEL_CENTER2 ~= 1 and ZIBO_FUEL_CENTER_QTY >= AceXSP_Zibo_FuelCenterMin then command_once("laminar/B738/toggle_switch/fuel_pump_ctr2") end
		else
			if ZIBO_FUEL_LEFT1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_lft1") end
			if ZIBO_FUEL_LEFT2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_lft2") end
			if ZIBO_FUEL_RIGHT1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt1") end
			if ZIBO_FUEL_RIGHT2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt2") end
			if ZIBO_FUEL_CENTER1 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_ctr1") end
			if ZIBO_FUEL_CENTER2 ~= 1 then command_once("laminar/B738/toggle_switch/fuel_pump_ctr2") end
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Fuel_On", "Switch_Fuel_On", "AceXSP_Switch_Fuel_On()", "", "")

	function AceXSP_Switch_Fuel_Off()
		if ZIBO_FUEL_LEFT1 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_lft1") end
		if ZIBO_FUEL_LEFT2 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_lft2") end
		if ZIBO_FUEL_RIGHT1 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt1") end
		if ZIBO_FUEL_RIGHT2 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_rgt2") end
		if ZIBO_FUEL_CENTER1 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_ctr1") end
		if ZIBO_FUEL_CENTER2 ~= 0 then command_once("laminar/B738/toggle_switch/fuel_pump_ctr2") end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Fuel_Off", "Switch_Fuel_Off", "AceXSP_Switch_Fuel_Off()", "", "")

	function AceXSP_Switch_Panel_On()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
		else
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Panel_On", "Switch_Panel_On", "AceXSP_Switch_Panel_On()", "", "")

	function AceXSP_Switch_Panel_Off()
		if XSP_FNBUTTON == 0 then
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
		else
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_up")
			command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
		end
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Panel_Off", "Switch_Panel_Off", "AceXSP_Switch_Panel_Off()", "", "")

	
	-- LAND LIGHTS
	function AceXSP_Switch_Land_On()
		command_once("laminar/B738/switch/land_lights_ret_left_dn")
		command_once("laminar/B738/switch/land_lights_ret_left_dn")
		command_once("laminar/B738/switch/land_lights_ret_right_dn")
		command_once("laminar/B738/switch/land_lights_ret_right_dn")
		
		-- Runway turnoff light ON only if aircraft is on the air (for descent), to exclude before takeoff
		if ZIBO_ON_GROUND == 0 then
			command_once("laminar/B738/switch/rwy_light_left_on")
			command_once("laminar/B738/switch/rwy_light_right_on")
		end
		
		set("laminar/B738/switch/land_lights_left_pos", 1)
		set("laminar/B738/switch/land_lights_right_pos", 1)
		set("laminar/B738/switch/land_lights_ret_left_pos", 2)
		set("laminar/B738/switch/land_lights_ret_right_pos", 2)
		set_array("sim/cockpit2/switches/landing_lights_switch", 0, 1)
		set_array("sim/cockpit2/switches/landing_lights_switch", 3, 1)
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Land_On", "Switch_Land_On", "AceXSP_Switch_Land_On()", "", "")
	
	function AceXSP_Switch_Land_Off()
		command_once("laminar/B738/switch/land_lights_ret_left_up")
		command_once("laminar/B738/switch/land_lights_ret_left_up")
		command_once("laminar/B738/switch/land_lights_ret_right_up")
		command_once("laminar/B738/switch/land_lights_ret_right_up")	
		
		-- Runway turnoff light OFF: only if aircraft is on the ground and visibility and daylight are good, or if aircraft is on the air
		if (ZIBO_ON_GROUND == 1 and AceXSP_Visib_Good() == true) or (ZIBO_ON_GROUND == 0) then
			command_once("laminar/B738/switch/rwy_light_left_off")
			command_once("laminar/B738/switch/rwy_light_right_off")
		end
		
		set("laminar/B738/switch/land_lights_left_pos", 0) 
		set("laminar/B738/switch/land_lights_right_pos", 0)
		set("laminar/B738/switch/land_lights_ret_left_pos", 0)
		set("laminar/B738/switch/land_lights_ret_right_pos", 0)
		set_array("sim/cockpit2/switches/landing_lights_switch", 0, 0)
		set_array("sim/cockpit2/switches/landing_lights_switch", 3, 0)
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Land_Off", "Switch_Land_Off", "AceXSP_Switch_Land_Off()", "", "")
	
	function AceXSP_Switch_Taxi_On()
	
		-- Runway turnoff light ON (only if ground visibility is low or hours of darkness)
		if (ZIBO_ON_GROUND == 1 and AceXSP_Visib_Good() == false) then
			command_once("laminar/B738/switch/rwy_light_left_on")
			command_once("laminar/B738/switch/rwy_light_right_on")
		end
		
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Taxi_On", "Switch_Taxi_On", "AceXSP_Switch_Taxi_On()", "", "")
	
	function AceXSP_Switch_Packs_Open()
	
		-- Pack left must be off (0) - move up
		if ZIBO_PACK_LEFT > 0 then
			command_once("laminar/B738/toggle_switch/l_pack_up")
		end
		if ZIBO_PACK_LEFT > 0 then
			command_once("laminar/B738/toggle_switch/l_pack_up")
		end
		
		-- Pack right must be off (0) - move up
		if ZIBO_PACK_RIGHT > 0 then
			command_once("laminar/B738/toggle_switch/r_pack_up")
		end
		if ZIBO_PACK_RIGHT > 0 then
			command_once("laminar/B738/toggle_switch/r_pack_up")
		end
		
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Packs_Open", "Switch_Packs_Open", "AceXSP_Switch_Packs_Open()", "", "")
	
	function AceXSP_Switch_Packs_Close()
	
		
		-- Pack left must be auto (1) - move in the middle
		if ZIBO_PACK_LEFT == 0 then
			command_once("laminar/B738/toggle_switch/l_pack_dn")
		elseif ZIBO_PACK_LEFT == 2 then
			command_once("laminar/B738/toggle_switch/l_pack_up")
		end
		
		-- Pack right must be auto (1) - move in the middle
		if ZIBO_PACK_RIGHT == 0 then
			command_once("laminar/B738/toggle_switch/r_pack_dn")
		elseif ZIBO_PACK_RIGHT == 2 then
			command_once("laminar/B738/toggle_switch/r_pack_up")
		end
		
		
		return
	end
	create_command("FlyWithLua/AceXSP/Switch_Packs_Close", "Switch_Packs_Close", "AceXSP_Switch_Packs_Close()", "", "")
		
end
