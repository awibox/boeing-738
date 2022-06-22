Terrain radar plugin v1.26 by Denis Antontsev (aka DrGluck) and Sergey Popovichev (aka Vanger)

X-Plane version: XP10 32/64-bit and XP11

OS version: Windows, Linux and MacOS

-------------------------------------------------------------------------------

Plugin work in two modes:
- integration into the navigation display (see the list of supported aircrafts)
- overlay window (all other aircrafts)

-------------------------------------------------------------------------------

ND integration supported aircrafts:

Boeing 737-800 by Zibo (XP11, v3.29+), Boeing 737-900 Ultimate (XP11, v1807+), Boeing 737NG LevelUp
    TERR button turns TR ON or OFF
    CTR switch in MAP mode: MAP EXP -> MAP CTR -> MAP CTR + VSD
    Vertical Situation Display
    Terrain collision prediction
Addition options:
    Position Trend Vector - 1, 2, 3 segments. Each segment represents 30 seconds
    GPWS system test

-------------------------------------------------------------------------------

Boeing 737-800 default (XP11) - both ND, TERR buttons supported

-------------------------------------------------------------------------------

Boeing 747-400 default (XP11) - both ND, TERR buttons supported

-------------------------------------------------------------------------------

Bell 429 Global Ranger by timber61 (XP10, XP11) - all displays, TERR button supported

-------------------------------------------------------------------------------

Boeing 777-200LR/200F/200ER/300ER by FlightFactor
    WXR/TERR button sequence: WXR -> TERR -> WXR -> none
    Terrain alert text messages on ND
    Terrain turns on during terrain alert

-------------------------------------------------------------------------------

Boeing C-17 Globemaster III by Virtavia (XP10, XP11)
    WXR/TERR button sequence: WXR -> TERR -> WXR -> none
    Terrain alert text message on PFD and HUD
    Terrain turns on during terrain alert

-------------------------------------------------------------------------------

Gulfstream G-IV SP by ghansen - both ND - both displays, TERR buttons supported
ATTENTION! You need version Gulfstream G-IV SP 1.2.1+ or Gulfstream G-IV SP V11 1.3.0+

-------------------------------------------------------------------------------

Cirrus SR20 G1000 by vFlyteAir - TERRAIN and TOPO buttons supported
ATTENTION! TerrainRadar Plugin Compatibility Patch is needed!

-------------------------------------------------------------------------------

Bombardier Challenger 300 by ddenn (XP10, XP11)
    XP11 v2 - TERR/WXR button
    XP10 - WXR/TERR button sequence: WXR -> TERR -> WXR -> none
    PULL UP message on PFD
    Terrain turns on during terrain alert

-------------------------------------------------------------------------------

Embraer E175/E195 by X-Crafts (XP11, v2.3+)
    Terrain on MFD - Terrain menu
    VSD on MFD - VSD button on MCP
    FMC waypoints on VSD (both Tekton and default FMC)
    Terrain alert text messages on ND
    Terrain turns on during terrain alert

-------------------------------------------------------------------------------

Embraer ERJ135/140/145/145XR and Legacy 650 by X-Crafts (XP11)
    Terrain on MFD - TERR button on MCP
    VSD on MFD - VSD button on MCP
    FMC waypoints on VSD (both Tekton and default FMC)
    Terrain alert text messages on ND
    Terrain turns on during terrain alert

-------------------------------------------------------------------------------

EADT Boeing x737-700/800 (XP10, XP11, v5.4+)
    TERR buttons supported, EXP or CTR mode

-------------------------------------------------------------------------------

Carenado DO228 100 HD SERIES
    WXR/TERR button sequence: WXR -> TERR -> WXR -> none

-------------------------------------------------------------------------------

FlyJSim Dash8-Q400 (XP10, XP11)
    WXR/TERR button sequence: WXR -> TERR -> WXR -> none

-------------------------------------------------------------------------------

JARDesign An-148 (XP10, XP11, v1.1)
    WXR/TERR button sequence: WXR -> TERR -> WXR -> none

-------------------------------------------------------------------------------

Tu-240/214 by Pilot-Sanya (XP11, v0.8+)
    Aircraft is under construction

-------------------------------------------------------------------------------

Boeing 787-900 by Magknight Aviators Edition (XP11, v.1.5+)
    WXR/TERR button sequence: WXR -> TERR -> WXR -> none
    Terrain alert text messages on ND
    Terrain turns on during terrain alert

-------------------------------------------------------------------------------

Boeing 787-900 by Magknight (XP11, before v.1.5)
    WXR/TERR button sequence: WXR -> TERR -> WXR -> none
    Terrain alert text messages on ND
    Terrain turns on during terrain alert

-------------------------------------------------------------------------------

Boeing 787 by VMAX (XP11, v.1.03)
    MXR button sequence: WXR -> TERR -> WXR -> none

-------------------------------------------------------------------------------

Falcon 7X by After (XP10 only)
    radar menu or hot key

-------------------------------------------------------------------------------

McDonnell Douglas MD-82 default (XP11)
    WXR/TERR button sequence: WXR -> TERR -> WXR -> none

-------------------------------------------------------------------------------

McDonnell Douglas MD-88 by Rotate (XP10, XP11)
    Use MAP mode in radar. Thanks to Rotate team for cooperation!

-------------------------------------------------------------------------------

Embraer EMB110 Bandeirante by Dreamfoil (XP11, v3.2+)
    Wx button in radar On/Ldg mode

-------------------------------------------------------------------------------

Pilatus PC-12 HD Series by Carenado (XP11, unofficial)
Beechcraft King Air B200 HD Series by Carenado (XP11, unofficial)
Beechcraft King Air C90 HD Series by Carenado (XP11, unofficial)
Beechcraft B1900 HD Series by Carenado (XP11, unofficial)
    Use LB5 button on Avidyne to change terrain modes
    Note: added virtual button, sorry for some graphic glitches

-------------------------------------------------------------------------------

Piaggio P.180 Avanti II by Airfighter (XP11, v2.3+)
    PFD and MFD - TERR/WX button
    Note: WXR disables TR on both displays. This is aircraft limitation

-------------------------------------------------------------------------------

Boeing 747-400 by YesAviation (XP11) - both ND, TERR buttons supported
    Note: right now this is almost the same as default B747-400, but I added new
          aircraft description for the future compatibility

-------------------------------------------------------------------------------

Boeing 717-200 by drwindows (the plane is in development!)
    WX radar Mode Selector - MAP
    WX/TERR Switch - Selects weather radar display on ND (MAP, VOR and APPR modes)
    Push again to deselect weather radar. Terrain is displayed when weather radar is not selected

-------------------------------------------------------------------------------

Airbus A300-600 by iniSimulations
    TERR buttons, both ND

-------------------------------------------------------------------------------

Overlay window: check "Show radar window" in "Terrain radar" plugin menu
    Radar range: 3, 5, 10, 20, 40, 80, 160 nm
    Position Trend Vector: 1, 2, 3 segments. Each segment represents 30 seconds

-------------------------------------------------------------------------------

How to install: put the folder "TerrainRadar" to "X-Plane/resources/plugins" folder

-------------------------------------------------------------------------------

Aircraft description patch feature:

For aircraft detection, TR plugin use "aircraft description" from aircraft model file ( ".acf" file ). Some users use
aircraft with a modified aircraft description (for various reasons). In this case, the plugin can not detect aircraft
model and goes into windowed mode. This is definitely a problem! What can be done in this situation? First, don't panic!

1. Go to the folder with the aircraft model file. For example: Dash-8 Q-400 by FlyJSim.
2. Find acf-file with the name "Dash8Q400.acf".
3. In this folder, make text file with the name "Dash8Q400.acf.terrain_radar_descr"
   This is the name of the original acf-file ("Dash8Q400.acf") plus the string ".terrain_radar_descr".
Note:
   From version 1.17.1 plugin looks for both files: "*.acf.terrain_radar_descr" and "*.acf.terrain_radar_descr.txt".
   File without ".txt" has priority if both files are present.
4. Open this file in any text editor and add string with original aircraft description
   for this model "Dash 8 Q400" (without quotes or any other symbols!).
   This line should be the only one in the file!
   If you managed to change the aircraft's description in Plane Maker, I think you know where to find original description.
5. Save the file.
6. ??????
7. PROFIT!

Now try to load this aircraft in X-Plane. If you did everything right, then the TR will work for this aircraft.

-------------------------------------------------------------------------------

Terrain aural messages:

The plugin detects a threat of collision with terrain and plays audio messages:
"CAUTION TERRAIN" - 60 seconds to collision
"TERRAIN PULL UP" - 30 seconds to collision
In order for the feature to work, both items in the plugin menu should be enabled: "EGPWS alerts" and "Terrain aural messages"
In this version it's done with ACT synthesized messages. But in the future this feature will be replaced with openAL.

Notes:
1. For the B737-800 Zibo family this feature is always on. The aircraft play it's own aural message.
2. For all supported aircrafts you can enable or disable this feature.
3. For all other aircrafts "Terrain aural messages" disabled by default on every new flight.
   This is to prevent collisions with the systems of some aircraft.
