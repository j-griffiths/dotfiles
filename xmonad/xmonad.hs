import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar .config/nixpkgs/.xmobarrc"
    xmonad $ docks defaultConfig
	{ terminal = "alacritty"
	, focusedBorderColor = "#4c3f59"
	, normalBorderColor = "#443f4a"
	, layoutHook = avoidStruts $ 
	  layoutHook defaultConfig
	, logHook = dynamicLogWithPP xmobarPP {
		ppOutput = hPutStrLn xmproc
		, ppTitle = xmobarColor "green" "" . shorten 50
		}
	}
