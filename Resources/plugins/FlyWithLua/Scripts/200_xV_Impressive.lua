-- This script is a part if xVision Impressive solution
---------------------------------------------------------
--water
local start_time = os.clock()
local do_once = true

function water()
	if os.clock() > start_time and do_once == true then
		set("sim/private/controls/water/fft_amp1", 2.0)
		set("sim/private/controls/water/fft_amp2", 0.2)
		set("sim/private/controls/water/fft_amp3", 2.5)
		set("sim/private/controls/water/fft_amp4", 10.0)
		set("sim/private/controls/water/fft_scale1", 15.0)
		set("sim/private/controls/water/fft_scale2", 64.8)
		set("sim/private/controls/water/fft_scale3", 21.5)
		set("sim/private/controls/water/fft_scale4", 1.5)
		do_once=true
	end
end
do_often("water()")
--sun
set("sim/private/controls/dome/sun_gain_1_hdr", 0.60)
set("sim/private/controls/dome/sun_gain_2_hdr", 3.50)

--clouds
set("sim/private/controls/skyc/white_out_in_clouds", 1.0)
set("sim/private/controls/clouds/ambient_gain", 1.70)
set("sim/private/controls/clouds/diffuse_gain", 0.6)
set("sim/private/controls/clouds/spec_gain", 6.0)
set("sim/private/controls/clouds/shad_radius", 0.9)
--set("sim/private/controls/cloud/fade_far_end", 0.95)
set("sim/private/controls/clouds/count_ratio/0", 0.1)
set("sim/private/controls/clouds/count_ratio/1", 0.1)
set("sim/private/controls/clouds/count_ratio/2", 0.1)
set("sim/private/controls/clouds/count_ratio/3", 0.1)
set("sim/private/controls/clouds/count_ratio/4", 0.1)
set("sim/private/controls/clouds/count_ratio/5", 0.1)
set("sim/private/controls/clouds/plot_radius", 1.1)
set("sim/private/controls/clouds/overdraw_control", 0.3)
-- shadows
set("sim/private/controls/clouds/cloud_shadow_lighten_ratio", 0.85)
--scattering
set("sim/private/controls/fog/fog_be_gone", 1.00)
set("sim/private/controls/atmo/scatter_raleigh_r", 5.00)
set("sim/private/controls/atmo/scatter_raleigh_g", 15.00)
set("sim/private/controls/atmo/scatter_raleigh_b", 35.00)
set("sim/private/controls/atmo/inscatter_gain_raleigh", 2.0)
--spot lights
set("sim/private/controls/lights/exponent_far", 0.48)
--hdr
set("sim/private/controls/hdr/white_point", 2.9)