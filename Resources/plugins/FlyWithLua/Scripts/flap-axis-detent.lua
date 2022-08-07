-- Flap Axis Detent 1.5
-- https://github.com/lrdn/flap-axis-detent
-- Copyright (c) 2019 LRDN <git@lrdn.net>
-- Released under the MIT license
-- Modified for HoneyComb Bravo

flap_ratio_dataref = {
	"laminar/B738/axis/flap_lever",
	"ixeg/733/hydraulics/hyd_flap_lever_act",
	"Rotate/md80/systems/flap_handle_drag_position_ratio",
	"sim/cockpit2/controls/flap_ratio"
}

for index, dataref in ipairs(flap_ratio_dataref) do
	if XPLMFindDataRef(dataref) ~= nil then
		flap_ratio_dataref = dataref
		break
	end
end

for index = 0, 500 do
	if get("sim/joystick/joystick_axis_assignments", index) == 11 then
		config = io.open(SCRIPT_DIRECTORY .. "flap-axis-detent.cfg", "w+")
		config:write(index)
		config:close()
	end
end

config = io.open(SCRIPT_DIRECTORY .. "flap-axis-detent.cfg", "r")

if config ~= nil then
	flap_axis = config:read()
	config:close()
end

if flap_axis ~= nil then
	flap_axis_assignment = get("sim/joystick/joystick_axis_assignments", flap_axis)
	flap_axis_reverse = get("sim/joystick/joystick_axis_reverse", flap_axis)

	if flap_axis_assignment == 0 or flap_axis_assignment == 11 then
		set_axis_assignment(flap_axis, "none", (flap_axis_reverse == 1 and "reverse") or "normal")
		dataref("flap_axis_max", "sim/joystick/joystick_axis_maximum", "readonly", flap_axis)
		dataref("flap_axis", "sim/joystick/joystick_axis_values", "readonly", flap_axis)
		dataref("flap_detents", "sim/aircraft/controls/acf_flap_detents", "readonly")
		dataref("flap_ratio", flap_ratio_dataref, "writeable")

        flap_axis_min = -0.30
		flap_step = 1.0 / 9
		flap_axis_last = 0

		function update_flap_ratio()
			if math.abs(flap_axis_last - flap_axis) > 0.0005 then
				flap_axis_map = math.abs(flap_axis_reverse - (flap_axis - flap_axis_min) / (1 - flap_axis_min))
				flap_ratio = math.floor(((flap_axis_map - flap_step) / flap_step) + 0.5) * flap_step + flap_step
				flap_axis_last = flap_axis
			end
		end

		do_every_frame("update_flap_ratio()")
	end
end