if (PLANE_ICAO == "B737" or PLANE_ICAO == "B738" or PLANE_ICAO == "B739") and (XPLMFindDataRef("laminar/B738/engine/indicators/N2_percent_1")) then

    -- --------------------------------------------------------------------------------
    -- SAITEK PANELS for Zibo Boeing 737-800, 700U and 900U by Geoff Lohrere
    -- --------------------------------------------------------------------------------

    -- Global Variables
    Script_Title = "Saitek script for Zibo " .. PLANE_ICAO .. ""
    Script_Version = "2.0.8"
    End_Time = os.time()
    Msg_Timer = 10
    PanelsReady = false
    SwitchPanel = false
    RadioPanel = false
    MultiPanel = false
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
    local XPLMlib = "XPLM_64"

    -- load the lib and store in local variable
    local XPLM = ffi.load(XPLMlib)

    -- define XPLM functions
    ffi.cdef [[
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
        logMsg("FlyWithLua Info: ** Plugin '" .. plugin_Signature .. "' found via Signature, ID = " .. sig_return .. ". Disabling::It conflicts with " .. Script_Title .. "")
        XPLM.XPLMDisablePlugin(sig_return)
        XPlanePluginID = "Yes (id=" .. sig_return .. ")"
        PluginStatus = 0
    else
        logMsg("FlyWithLua Info: ** Plugin '" .. plugin_Signature .. "' not found via Signature. Saitek plugin not loaded so nothing to disable")
        XPlanePluginID = "No"
    end

    function Init_Loop()
        if PanelsReady == true then
            return
        end

        dataref("SwitchPanelCount", "bgood/xsaitekpanels/switchpanel/count", "writable")
        dataref("RadioPanelCount", "bgood/xsaitekpanels/radiopanel/count", "writable")
        dataref("MultiPanelCount", "bgood/xsaitekpanels/multipanel/count", "writable")

        if SwitchPanelCount > 0 then
            SwitchPanel = true
        end
        if RadioPanelCount > 0 then
            RadioPanel = true
        end
        if MultiPanelCount > 0 then
            MultiPanel = true
        end

        if SwitchPanel == false and RadioPanel == false and MultiPanel == false then
            return
        end
        PanelsReady = true
        logMsg("FlyWithLua Info: ** Starting Zibo " .. PLANE_ICAO .. " version " .. Script_Version .. " for multi and switch panel")

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
            dataref("HYDRO_ELEC1", "laminar/B738/toggle_switch/electric_hydro_pumps1_pos", "writable")
            dataref("HYDRO_ELEC2", "laminar/B738/toggle_switch/electric_hydro_pumps2_pos", "writable")
            dataref("Battery_Cover", "laminar/B738/button_switch/cover_position", "readonly", 2)
            dataref("Battery_Position", "laminar/B738/electric/battery_pos", "writable")
            dataref("Panel_Brightness0", "laminar/B738/electric/panel_brightness", "writable", 0)
            dataref("Panel_Brightness1", "laminar/B738/electric/panel_brightness", "writable", 1)
            dataref("Panel_Brightness2", "laminar/B738/electric/panel_brightness", "writable", 2)
            dataref("Panel_Brightness3", "laminar/B738/electric/panel_brightness", "writable", 3)
            dataref("Flood_Brightness6", "laminar/B738/electric/generic_brightness", "writable", 6)
            dataref("Flood_Brightness7", "laminar/B738/electric/generic_brightness", "writable", 7)
            dataref("Flood_Brightness8", "laminar/B738/electric/generic_brightness", "writable", 8)
            dataref("Flood_Brightness10", "laminar/B738/electric/generic_brightness", "writable", 10)
            dataref("Flood_Brightness11", "laminar/B738/electric/generic_brightness", "writable", 11)
            dataref("Flood_Brightness12", "laminar/B738/electric/generic_brightness", "writable", 12)
            dataref("ADIRUSwitchL", "laminar/B738/toggle_switch/irs_left", "readonly")
            dataref("ADIRUSwitchR", "laminar/B738/toggle_switch/irs_right", "readonly")
        end

        if RadioPanel then
            dataref("ACTSTBY_STATUS_UP", "bgood/xsaitekpanels/radiopanel/rad1upractstby/status", "readonly")
            dataref("XPDR_STATUS_UP", "bgood/xsaitekpanels/radiopanel/rad1uprxpdr/status", "readonly")
            dataref("XPDR_CRS_INC_UP", "bgood/xsaitekpanels/radiopanel/rad1uprfineincticks/status", "readonly")
            dataref("XPDR_CRS_DEC_UP", "bgood/xsaitekpanels/radiopanel/rad1uprfinedecticks/status", "readonly")
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
            dataref("MULTI_AT_SWITCH", "bgood/xsaitekpanels/multipanel/at/status", "readonly")
            dataref("MULTI_POS_LIGHT", "laminar/B738/toggle_switch/position_light_pos", "readonly")
            dataref("MULTI_GEAR", "sim/cockpit2/controls/gear_handle_down", "readonly")
            dataref("MULTI_GEAR_SAFE", "sim/flightmodel2/gear/deploy_ratio", "readonly")
            dataref("MULTI_AUTOBRAKE", "laminar/B738/autobrake/autobrake_pos2", "readonly")
            dataref("MULTI_CABIN_ALT", "laminar/B738/annunciator/cabin_alt", "readonly")
            dataref("MULTI_FIRE_1", "laminar/B738/annunciator/engine1_fire", "readonly")
            dataref("MULTI_FIRE_2", "laminar/B738/annunciator/engine2_fire", "readonly")
            dataref("MULTI_MASTER_CAUTION", "laminar/B738/annunciator/master_caution_light", "readonly")
            dataref("MULTI_LOWERDU_SYS", "laminar/B738/systems/lowerDU_page2", "readonly")
            dataref("MULTI_YAW", "laminar/B738/annunciator/yaw_damp", "readonly")
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
        table.insert(Button_Table, { _dataref, _on_value, _off_value, SIM_TIME + _delay })
        set(_dataref, _on_value)
    end
    Command_Table = {}
    function CommandBegin(_dataref, delay)
        local _delay = delay or 0.15
        table.insert(Command_Table, { _dataref, SIM_TIME + _delay })
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
            if (#Command_Table == 0) then
                return
            end
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
        if SwitchPanel == false then
            return
        end
        if SWITCH_STARTOFF == 1 and Auto_Brake_Setting ~= 1 then
            command_once("laminar/B738/knob/autobrake_rto")
            Auto_Brake_Setting = 1
        end
        if SWITCH_STARTRIGHT == 1 and Auto_Brake_Setting ~= 2 then
            command_once("laminar/B738/knob/autobrake_off")
            Auto_Brake_Setting = 2
        end
        if SWITCH_STARTLEFT == 1 and Auto_Brake_Setting ~= 3 then
            command_once("laminar/B738/knob/autobrake_1")
            Auto_Brake_Setting = 3
        end
        if SWITCH_STARTBOTH == 1 and Auto_Brake_Setting ~= 4 then
            command_once("laminar/B738/knob/autobrake_2")
            Auto_Brake_Setting = 4
        end
        if SWITCH_STARTSTART == 1 and Auto_Brake_Setting ~= 5 then
            command_once("laminar/B738/knob/autobrake_3")
            Auto_Brake_Setting = 5
        end
    end
    do_every_frame("auto_brake_loop()")

    -- --------------------------------------------------------------------------------

    -- Bat
    function Cmd_SP_Bat_On()
        if Battery_Cover == 1 then
            CommandBegin("laminar/B738/button_switch_cover02")
            command_once("jd/copilot/widget")
        end
        Battery_Position = 1
    end
    create_command("FlyWithLua/B738/Cmd_SP_Bat_On", "Cmd_SP_Bat_On", "Cmd_SP_Bat_On()", "", "")

    function Cmd_SP_Bat_Off()
        if Battery_Cover == 0 then
            CommandBegin("laminar/B738/button_switch_cover02")
        end
        Battery_Position = 0
    end
    create_command("FlyWithLua/B738/Cmd_SP_Bat_Off", "Cmd_SP_Bat_Off", "Cmd_SP_Bat_Off()", "", "")

    -- --------------------------------------------------------------------------------

    -- Alt
    function Cmd_SP_Alt_On()
        HYDRO_ELEC1 = 1
        HYDRO_ELEC2 = 1
    end
    create_command("FlyWithLua/B738/Cmd_SP_Alt_On", "Cmd_SP_Alt_On", "Cmd_SP_Alt_On()", "", "")

    function Cmd_SP_Alt_Off()
        HYDRO_ELEC1 = 0
        HYDRO_ELEC2 = 0
    end
    create_command("FlyWithLua/B738/Cmd_SP_Alt_Off", "Cmd_SP_Alt_Off", "Cmd_SP_Alt_Off()", "", "")

    -- --------------------------------------------------------------------------------

    -- Avionics master
    function Cmd_SP_Avionics()
        if SWITCH_AVIONICS == 1 then
            if ADIRU == true then
                return
            end
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
            if ADIRU == false then
                return
            end
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
        set("laminar/B738/fuel/fuel_tank_pos_lft1", 1)
        set("laminar/B738/fuel/fuel_tank_pos_lft2", 1)
        set("laminar/B738/fuel/fuel_tank_pos_rgt1", 1)
        set("laminar/B738/fuel/fuel_tank_pos_rgt2", 1)
    end
    create_command("FlyWithLua/B738/Cmd_SP_FuelPump_On", "Cmd_SP_FuelPump_On", "Cmd_SP_FuelPump_On()", "", "")

    function Cmd_SP_FuelPump_Off()
        set("laminar/B738/fuel/fuel_tank_pos_lft1", 0)
        set("laminar/B738/fuel/fuel_tank_pos_lft2", 0)
        set("laminar/B738/fuel/fuel_tank_pos_rgt1", 0)
        set("laminar/B738/fuel/fuel_tank_pos_rgt2", 0)
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
        command_once("laminar/B738/knob/transponder_tara")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Cowl_On", "Cmd_SP_Cowl_On", "Cmd_SP_Cowl_On()", "", "")

    function Cmd_SP_Cowl_Off()
        command_once("laminar/B738/knob/transponder_stby")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Cowl_Off", "Cmd_SP_Cowl_Off", "Cmd_SP_Cowl_Off()", "", "")

    -- --------------------------------------------------------------------------------

    -- Panel
    function Cmd_SP_Panel_On()
        command_once("laminar/B738/switch/wing_light_on")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Panel_On", "Cmd_SP_Panel_On", "Cmd_SP_Panel_On()", "", "")

    function Cmd_SP_Panel_Off()
        command_once("laminar/B738/switch/wing_light_off")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Panel_Off", "Cmd_SP_Panel_Off", "Cmd_SP_Panel_Off()", "", "")

    -- --------------------------------------------------------------------------------

    -- Beacon
    function Cmd_SP_Beacon_On()
        command_once("sim/lights/beacon_lights_on")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Beacon_On", "Cmd_SP_Beacon_On", "Cmd_SP_Beacon_On()", "", "")

    function Cmd_SP_Beacon_Off()
        command_once("sim/lights/beacon_lights_off")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Beacon_Off", "Cmd_SP_Beacon_Off", "Cmd_SP_Beacon_Off()", "", "")

    -- --------------------------------------------------------------------------------

    -- Nav
    function Cmd_SP_Nav_On()
        command_once("laminar/B738/switch/logo_light_on")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Nav_On", "Cmd_SP_Nav_On", "Cmd_SP_Nav_On()", "", "")

    function Cmd_SP_Nav_Off()
        command_once("laminar/B738/switch/logo_light_off")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Nav_Off", "Cmd_SP_Nav_Off", "Cmd_SP_Nav_Off()", "", "")

    -- --------------------------------------------------------------------------------

    -- Strobe
    function Cmd_SP_Strobe_On()
        command_once("laminar/B738/toggle_switch/position_light_strobe")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Strobe_On", "Cmd_SP_Strobe_On", "Cmd_SP_Strobe_On()", "", "")

    function Cmd_SP_Strobe_Off()
        command_once("laminar/B738/toggle_switch/position_light_steady")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Strobe_Off", "Cmd_SP_Strobe_Off", "Cmd_SP_Strobe_Off()", "", "")

    -- --------------------------------------------------------------------------------

    -- Taxi
    function Cmd_SP_Taxi_On()
        if PLANE_ICAO == "B737" or "B739" then
            command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_dn")
            command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_dn")
        else
            command_once("laminar/B738/toggle_switch/taxi_light_brightness_on")
        end
        command_once("laminar/B738/switch/rwy_light_left_on")
        command_once("laminar/B738/switch/rwy_light_right_on")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Taxi_On", "Cmd_SP_Taxi_On", "Cmd_SP_Taxi_On()", "", "")

    function Cmd_SP_Taxi_Off()
        if PLANE_ICAO == "B737" or "B739" then
            command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_up")
            command_once("laminar/B738/toggle_switch/taxi_light_brightness_pos_up")
        else
            command_once("laminar/B738/toggle_switch/taxi_light_brightness_off")
        end
        command_once("laminar/B738/switch/rwy_light_left_off")
        command_once("laminar/B738/switch/rwy_light_right_off")
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
    end
    create_command("FlyWithLua/B738/Cmd_SP_Landing_On", "Cmd_SP_Landing_On", "Cmd_SP_Landing_On()", "", "")

    function Cmd_SP_Landing_Off()
        if PLANE_ICAO == "B737" then
            set("laminar/B738/switch/land_lights_left_pos", 0)
            set("laminar/B738/switch/land_lights_right_pos", 0)
        else
            command_once("sim/lights/landing_lights_off")
        end
    end
    create_command("FlyWithLua/B738/Cmd_SP_Landing_Off", "Cmd_SP_Landing_Off", "Cmd_SP_Landing_Off()", "", "")

    -- --------------------------------------------------------------------------------

    -- Gear
    function Cmd_SP_Gear_Dn()
        command_once("laminar/B738/push_button/gear_down")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Gear_Dn", "Cmd_SP_Gear_Dn", "Cmd_SP_Gear_Dn()", "", "")

    function Cmd_SP_Gear_Up()
        command_once("laminar/B738/push_button/gear_up")
    end
    create_command("FlyWithLua/B738/Cmd_SP_Gear_Up", "Cmd_SP_Gear_Up", "Cmd_SP_Gear_Up()", "", "")


    -- --------------------------------------------------------------------------------
    -- HONEY COMB FUNCTIONS
    -- --------------------------------------------------------------------------------

    function Cmd_HC_FUEL_FLOW()
        CommandBegin("laminar/B738/toggle_switch/fuel_flow_up")
    end
    create_command("FlyWithLua/B738/Cmd_HC_FUEL_FLOW", "Cmd_HC_FUEL_FLOW", "Cmd_HC_FUEL_FLOW()", "", "")

    -- --------------------------------------------------------------------------------
    -- OTHER FUNCTIONS
    -- --------------------------------------------------------------------------------

    -- Cowl
    function Cmd_OT_Cont_On()
        command_once("laminar/B738/rotary/eng1_start_cont")
        command_once("laminar/B738/rotary/eng2_start_cont")
    end
    create_command("FlyWithLua/B738/Cmd_OT_Cont_On", "Cmd_OT_Cont_On", "Cmd_OT_Cont_On()", "", "")

    function Cmd_OT_Cont_Off()
        command_once("laminar/B738/rotary/eng1_start_off")
        command_once("laminar/B738/rotary/eng2_start_off")
    end
    create_command("FlyWithLua/B738/Cmd_OT_Cont_Off", "Cmd_OT_Cont_Off", "Cmd_OT_Cont_Off()", "", "")

    -- Panel
    function Cmd_OT_Panel_On()
        Panel_Brightness0 = .8
        Panel_Brightness1 = .8
        Panel_Brightness2 = .8
        Panel_Brightness3 = .8
    end
    create_command("FlyWithLua/B738/Cmd_OT_Panel_On", "Cmd_OT_Panel_On", "Cmd_OT_Panel_On()", "", "")

    function Cmd_OT_Panel_Off()
        Panel_Brightness0 = 0
        Panel_Brightness1 = 0
        Panel_Brightness2 = 0
        Panel_Brightness3 = 0
    end
    create_command("FlyWithLua/B738/Cmd_OT_Panel_Off", "Cmd_OT_Panel_Off", "Cmd_OT_Panel_Off()", "", "")

    function Cmd_OT_Flood_On()
        Flood_Brightness6 = .8
        Flood_Brightness7 = .8
        Flood_Brightness8 = .8
        Flood_Brightness10 = .8
        Flood_Brightness11 = .8
        Flood_Brightness12 = .8
    end
    create_command("FlyWithLua/B738/Cmd_OT_Flood_On", "Cmd_OT_Flood_On", "Cmd_OT_Flood_On()", "", "")

    function Cmd_OT_Flood_Off()
        Flood_Brightness6 = 0
        Flood_Brightness7 = 0
        Flood_Brightness8 = 0
        Flood_Brightness10 = 0
        Flood_Brightness11 = 0
        Flood_Brightness12 = 0
    end
    create_command("FlyWithLua/B738/Cmd_OT_Flood_Off", "Cmd_OT_Flood_Off", "Cmd_OT_Flood_Off()", "", "")

    function Cmd_OT_ATTEND()
        CommandBegin("laminar/B738/push_button/attend")
    end
    create_command("FlyWithLua/B738/Cmd_OT_ATTEND", "Cmd_OT_ATTEND", "Cmd_OT_ATTEND()", "", "")

    function Cmd_APUStart_Pos()
        CommandBegin("laminar/B738/spring_toggle_switch/APU_start_pos_dn")
        CommandBegin("laminar/B738/spring_toggle_switch/APU_start_pos_dn", 5)
    end
    create_command("FlyWithLua/B738/Cmd_APUStart_Pos", "Cmd_APUStart_Pos", "Cmd_APUStart_Pos()", "", "")

    function Cmd_OT_FIRE_TEST()
        CommandBegin("laminar/B738/toggle_switch/fire_test_lft", 1)
    end
    create_command("FlyWithLua/B738/Cmd_OT_FIRE_TEST", "Cmd_OT_FIRE_TEST", "Cmd_OT_FIRE_TEST()", "", "")

    function Cmd_OT_FIRE_TEST2()
        CommandBegin("laminar/B738/toggle_switch/exting_test_lft", 1)
    end
    create_command("FlyWithLua/B738/Cmd_OT_FIRE_TEST2", "Cmd_OT_FIRE_TEST2", "Cmd_OT_FIRE_TEST2()", "", "")

    function Cmd_OT_FIRE_exting()
        CommandBegin("laminar/B738/toggle_switch/fire_test_rgt", 5)
    end
    create_command("FlyWithLua/B738/Cmd_OT_FIRE_exting", "Cmd_OT_FIRE_exting", "Cmd_OT_FIRE_exting()", "", "")

    function Cmd_OT_FIRE_exting2()
        CommandBegin("laminar/B738/toggle_switch/exting_test_rgt", 1)
    end
    create_command("FlyWithLua/B738/Cmd_OT_FIRE_exting2", "Cmd_OT_FIRE_exting2", "Cmd_OT_FIRE_exting2()", "", "")

    function Cmd_OT_GPWS()
        CommandBegin("laminar/B738/push_button/gpws_test", 1)
    end
    create_command("FlyWithLua/B738/Cmd_OT_GPWS", "Cmd_OT_GPWS", "Cmd_OT_GPWS()", "", "")

    function Cmd_OT_Recall()
        CommandBegin("laminar/B738/push_button/capt_six_pack", 1)
    end
    create_command("FlyWithLua/B738/Cmd_OT_Recall", "Cmd_OT_Recall", "Cmd_OT_Recall()", "", "")

    function Cmd_OT_Cargo()
        CommandBegin("laminar/B738/push_button/cargo_fire_test_push", 3)
    end
    create_command("FlyWithLua/B738/Cmd_OT_Cargo", "Cmd_OT_Cargo", "Cmd_OT_Cargo()", "", "")

    function Cmd_OT_mach()
        CommandBegin("laminar/B738/push_button/mach_warn1_test", 1)
        CommandBegin("laminar/B738/push_button/mach_warn2_test", 1)
    end
    create_command("FlyWithLua/B738/Cmd_OT_mach", "Cmd_OT_mach", "Cmd_OT_mach()", "", "")

    function Cmd_OT_Light_test_up()
        CommandBegin("laminar/B738/toggle_switch/bright_test_up")
    end
    create_command("FlyWithLua/B738/Cmd_OT_Light_test_up", "Cmd_OT_Light_test_up", "Cmd_OT_Light_test_up()", "", "")

    function Cmd_OT_Light_test_dn()
        CommandBegin("laminar/B738/toggle_switch/bright_test_dn")
    end
    create_command("FlyWithLua/B738/Cmd_OT_Light_test_dn", "Cmd_OT_Light_test_dn", "Cmd_OT_Light_test_dn()", "", "")

    -- GENS
    function Cmd_OT_Gen_On()
        CommandBegin("laminar/B738/toggle_switch/gen1_dn")
        CommandBegin("laminar/B738/toggle_switch/gen2_dn")
    end
    create_command("FlyWithLua/B738/Cmd_OT_Gen_On", "Cmd_OT_Gen_On", "Cmd_OT_Gen_On()", "", "")

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
        CommandBegin("laminar/B738/push_button/master_caution1")
    end
    create_command("FlyWithLua/B738/Cmd_MP_AP", "Cmd_MP_AP", "Cmd_MP_AP()", "", "")

    -- --------------------------------------------------------------------------------

    -- HDG
    function Cmd_MP_HDG()
        if MULTI_POS_LIGHT == 0 then
            command_once("laminar/B738/toggle_switch/position_light_steady")
        else
            command_once("laminar/B738/toggle_switch/position_light_off")
        end
    end
    create_command("FlyWithLua/B738/Cmd_MP_HDG", "Cmd_MP_HDG", "Cmd_MP_HDG()", "", "")

    -- --------------------------------------------------------------------------------

    -- NAV
    function Cmd_MP_NAV()
        command_once("laminar/B738/toggle_switch/yaw_dumper")
    end
    create_command("FlyWithLua/B738/Cmd_MP_NAV", "Cmd_MP_NAV", "Cmd_MP_NAV()", "", "")

    -- --------------------------------------------------------------------------------

    -- IAS
    function Cmd_MP_IAS()
        CommandBegin("laminar/B738/alert/alt_horn_cutout")
    end
    create_command("FlyWithLua/B738/Cmd_MP_IAS", "Cmd_MP_IAS", "Cmd_MP_IAS()", "", "")

    -- --------------------------------------------------------------------------------

    -- ALT
    function Cmd_MP_ALT()
        command_once("laminar/B738/knob/autobrake_max")
    end
    create_command("FlyWithLua/B738/Cmd_MP_ALT", "Cmd_MP_ALT", "Cmd_MP_ALT()", "", "")

    -- --------------------------------------------------------------------------------

    -- VS
    function Cmd_MP_VS()
        CommandBegin("laminar/B738/LDU_control/push_button/MFD_SYS")
    end
    create_command("FlyWithLua/B738/Cmd_MP_VS", "Cmd_MP_VS", "Cmd_MP_VS()", "", "")

    -- --------------------------------------------------------------------------------

    -- APR
    function Cmd_MP_APR()
        command_once("laminar/B738/fire/engine01/ext_switch_arm")
    end
    create_command("FlyWithLua/B738/Cmd_MP_APR", "Cmd_MP_APR", "Cmd_MP_APR()", "", "")

    -- --------------------------------------------------------------------------------

    -- REV
    function Cmd_MP_REV()
        command_once("laminar/B738/fire/engine02/ext_switch_arm")
    end
    create_command("FlyWithLua/B738/Cmd_MP_REV", "Cmd_MP_REV", "Cmd_MP_REV()", "", "")

    -- --------------------------------------------------------------------------------

    -- Flaps
    function Cmd_MP_Flaps_Dn()
        command_once("laminar/B738/toggle_switch/seatbelt_sign_dn")
    end
    create_command("FlyWithLua/B738/Cmd_MP_Flaps_Dn", "Cmd_MP_Flaps_Dn", "Cmd_MP_Flaps_Dn()", "", "")

    function Cmd_MP_Flaps_Up()
        command_once("laminar/B738/toggle_switch/seatbelt_sign_up")
    end
    create_command("FlyWithLua/B738/Cmd_MP_Flaps_Up", "Cmd_MP_Flaps_Up", "Cmd_MP_Flaps_Up()", "", "")

    -- --------------------------------------------------------------------------------

    -- Trim
    function Cmd_MP_Trim_Dn()
        CommandBegin("laminar/B738/knob/left_wiper_dn")
        CommandBegin("laminar/B738/knob/right_wiper_dn")
    end
    create_command("FlyWithLua/B738/Cmd_MP_Trim_Dn", "Cmd_MP_Trim_Dn", "Cmd_MP_Trim_Dn()", "", "")

    function Cmd_MP_Trim_Up()
        CommandBegin("laminar/B738/knob/left_wiper_up")
        CommandBegin("laminar/B738/knob/right_wiper_up")
    end
    create_command("FlyWithLua/B738/Cmd_MP_Trim_Up", "Cmd_MP_Trim_Up", "Cmd_MP_Trim_Up()", "", "")

    -- --------------------------------------------------------------------------------
    -- REFRESH MULTI PANEL LIGHTS
    -- --------------------------------------------------------------------------------

    function RefreshLights()
        if MultiPanel then
            -- Master Caution
            if MULTI_MASTER_CAUTION == 1 then
                Status_Integer1 = 2
            else
                Status_Integer1 = 0
            end
            -- POS Light
            if MULTI_POS_LIGHT == -1 then
                Status_Integer2 = 2
            elseif MULTI_POS_LIGHT == 1 then
                Status_Integer2 = 0
            else
                Status_Integer2 = 1
            end
            -- YAW
            if MULTI_YAW == 1 then
                Status_Integer3 = 2
            else
                Status_Integer3 = 0
            end
            -- CABIN ALT
            if MULTI_CABIN_ALT == 1 then
                Status_Integer4 = 2
            else
                Status_Integer4 = 0
            end
            -- AUTOBRAKE
            if MULTI_AUTOBRAKE == 1 then
                Status_Integer5 = 2
            else
                Status_Integer5 = 0
            end
            -- LOWER DU SYS
            if MULTI_LOWERDU_SYS == 1 then
                Status_Integer6 = 2
            else
                Status_Integer6 = 0
            end
            -- FIRE1
            if MULTI_FIRE_1 == 1 then
                Status_Integer7 = 2
            else
                Status_Integer7 = 0
            end
            -- FIRE2
            if MULTI_FIRE_2 == 1 then
                Status_Integer8 = 2
            else
                Status_Integer8 = 0
            end
            -- AT
            if MULTI_AT_SWITCH == 1 then
                command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
                command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
            elseif MULTI_AT_SWITCH == 0 then
                command_once("laminar/B738/toggle_switch/cockpit_dome_up")
                command_once("laminar/B738/toggle_switch/cockpit_dome_up")
                command_once("laminar/B738/toggle_switch/cockpit_dome_dn")
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
        graphics.draw_rectangle(xpos, ypos, xpos + boxWidth, ypos + boxHeight)
        graphics.set_color(1.0, 1.0, 1.0, 1.0);
        draw_string_Helvetica_18(xpos + 10, ypos + boxHeight - 25, Script_Title .. " ver. " .. Script_Version)
        graphics.set_color(0.0, 1.0, 0.0, 1.0);
        draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 41, "Message expires in: " .. Msg_Timer .. " seconds or press space.")
        graphics.set_color(1.0, 1.0, 0.0, 1.0);
        draw_string_Helvetica_10(xpos + 10, ypos + boxHeight - 57, "NOTE: XPlane Plugin1.2.6.0 conflicts with xsaitek scripts so it")
        draw_string_Helvetica_10(xpos + 10, ypos + boxHeight - 72, "will be disabled if it exists, but will be reenabled on exit.")
        graphics.set_color(1.0, 1.0, 1.0, 1.0);
        draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 89, "Plane ICAO: " .. PLANE_ICAO)
        draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 104, "Switch Panel: " .. YesNo_String(SwitchPanel))
        draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 119, "Multi Panel: " .. YesNo_String(MultiPanel))
        draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 134, "Radio Panel: " .. YesNo_String(RadioPanel))
        draw_string_Helvetica_12(xpos + 10, ypos + boxHeight - 149, "XPlane Plugin: " .. XPlanePluginID .. "")
    end

    function draw_loop()
        key_pressed()
        if End_Time < os.time() then
            Msg_Timer = Msg_Timer - 1
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
