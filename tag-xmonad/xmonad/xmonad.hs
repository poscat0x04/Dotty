{-# LANGUAGE LambdaCase #-}

import           XMonad
import           XMonad.Actions.CycleRecentWS
import           XMonad.Actions.CycleWindows
import           XMonad.Config
import           XMonad.Core
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.SetWMName
import           XMonad.Layout.NoBorders
import           XMonad.Layout.Spacing
import           XMonad.Layout.Tabbed
import           XMonad.Layout.TwoPane
import           XMonad.Main
import           XMonad.ManageHook
import           XMonad.StackSet              (RationalRect (..), floating,
                                               greedyView, shift, swapDown,
                                               swapUp, view)
import           XMonad.Util.EZConfig
import           XMonad.Util.Run

import           Control.Concurrent.MVar
import           Data.Char                    (toLower)
import qualified Data.Map                     (Map, keys)
import           Data.Monoid                  ((<>))
import           Data.Ratio
import           System.Exit                  (exitSuccess)

term :: String
term = "alacritty"
normalBC :: String
normalBC = "#778899"
focusedBC :: String
focusedBC = "#007FFF"
modM :: KeyMask
modM = mod4Mask
bw :: Dimension
bw = 3

mHooks :: ManageHook
mHooks = manageDocks
         <+> composeOne [ stringProperty "WM_WINDOW_ROLE" =? "browser"              -?> doShift "browser"
                        , stringProperty "WM_NAME"   =? "Media viewer"              -?> doCenterFloat
                        , className =? "TelegramDesktop"                            -?> doShift "im"
                        , appName =? "xmessage"                                     -?> doCenterFloat
                        , stringProperty "WM_WINDOW_ROLE" =? "GtkFileChooserDialog" -?> floatCenteringWithRatio (2%3) (2%3)
                        , className =? "Vlc"                                        -?> doCenterFloat
                        , className =? "Thunderbird"                                -?> doShift "media"
                        , className =? "wpa_gui"                                    -?> floatCenteringWithRatio (1%2) (1%2)
                        , appName =? "albert"                                       -?> doCenterFloat
                        , isFullscreen                                              -?> doFullFloat
                        , stringProperty "WM_NAME"        =? "Open Folder"          -?> doCenterFloat
                        ]
         <+> manageHook def


floatCenteringWithRatio :: Rational -> Rational -> ManageHook
floatCenteringWithRatio rx ry = doRectFloat $
                                RationalRect (1%2 - rx/2) (1%2 - ry/2) rx ry

ws :: [String]
ws = ["term", "browser", "ide", "docs", "im", "media"] ++ map show [1..10]

prefixStr :: String -> String -> Bool
prefixStr s s' = s == length s `take` s'

subStr :: String -> String -> Bool
subStr s = \case
             s'@(x:xs) -> prefixStr s s' || subStr s xs
             _         -> False

-- switch between mute and unmute
mute :: X ()
mute = do
  s <- liftIO $ runProcessWithInput "pamixer" ["--get-mute"] ""
  if "true" `subStr` s
    then spawn "pamixer -u"
    else spawn "pamixer -m"

-- | switch between "safe" bg and "not safe" bg
setBG :: (MVar Bool) -> IO ()
setBG mv = do
  s <- takeMVar mv
  if s
    then do
      spawn "nitrogen --set-zoom-fill Pictures/64400529_p0.jpg"
      putMVar mv False
    else do
      spawn "nitrogen --set-zoom-fill Pictures/58c3b8b6c144d6ec4b840b2cf6b691f8373a.jpg"
      putMVar mv True

cleanRestart :: X ()
cleanRestart = composeAll [ spawn "pkill flux"
                          , spawn "pkill gebaard"
                          , restart "xmonad" True
                          ]

xkeys :: (MVar Bool) -> XConfig Layout -> Data.Map.Map (KeyMask, KeySym) (X ())
xkeys bgState = \c -> mkKeymap c $
    [ ("M-S-<Return>"            , spawn $ terminal c)
      -- Cycle between workspaces, emulates the alt-tab behavior of other DMs
    , ("M1-<Tab>"                , cycleRecentWS [xK_Alt_L] xK_Tab xK_Tab)
    , ("M-<Tab>"                 , cycleRecentWindows [xK_Super_L] xK_Tab xK_Tab)
    , ("M-q"                     , cleanRestart)
    , ("M-S-q"                   , io exitSuccess)
    , ("M-S-c"                   , kill)
    , ("M-<Space>"               , sendMessage NextLayout)
    , ("M-S-<Space>"             , setLayout $ layoutHook c)
    , ("M-S-j"                   , windows swapDown)
    , ("M-S-k"                   , windows swapUp)
    , ("M-S-s"                   , liftIO $ setBG bgState)
    , ("M-S-l"                   , spawn "dm-tool lock")
      -- Brightness
    , ("<XF86MonBrightnessUp>"   , spawn "brightnessctl s +5%")
    , ("<XF86MonBrightnessDown>" , spawn "brightnessctl s 5%-")
      -- PulseAudio
    , ("<XF86AudioRaiseVolume>"  , spawn "pamixer -i 5")
    , ("<XF86AudioLowerVolume>"  , spawn "pamixer -d 5")
    , ("<XF86AudioMute>"         , mute)
      -- Screenshot
    , ("M-S-p"                   , spawn "maim -s ~/Screenshots/Screenshot-`date +%Y-%m-%d-%T`.png")
    , ("M-S-C-p"                 , spawn "maim ~/Screenshots/Screenshot-`date +%Y-%m-%d-%T`.png")
    ]
    ++
    [(otherModMasks ++ "M-" ++ show i, action w)
    | (w, i) <- zip (workspaces c) [1..9]
    , (otherModMasks, action) <- [ (""  , windows . greedyView)
                                 , ("S-", windows . shift)]
    ]

lHooks = spacingRaw True (Border 0 0 6 6) True (Border 0 0 6 6) True $
         avoidStruts $
         TwoPane delta ratio
     ||| noBorders (tabbed shrinkText tabConf)
     ||| noBorders Full
     where
       delta = 0.03
       ratio = 0.5

sHooks :: X ()
sHooks = composeAll [ spawn "picom -f"
                    , spawn "albert"
                    , spawn "fcitx5"
                    , spawn "nitrogen --set-zoom-fill Pictures/64400529_p0.jpg"
                    , spawn "xsetroot -cursor_name left_ptr"
                    , spawn "gebaard"
                    , spawn "fluxgui"
                    , spawn "screenrotator"
                    , spawn "ghc -dynamic .xmonad/DesktopCycler.hs -o .xmonad/switcher"
                    , setWMName "LG3D"
                    ]


hHooks = fullscreenEventHook
     <+> docksEventHook

tabConf = def { activeColor = "#556064"
              , decoHeight = 48
              , inactiveColor = "#2F3D44"
              , urgentColor = "#FDF6E3"
              , activeBorderColor = "#454948"
              , inactiveBorderColor = "#454948"
              , urgentBorderColor = "#268BD2"
              , activeTextColor = "#80FFF9"
              , inactiveTextColor = "#1ABC9C"
              , urgentTextColor = "#1ABC9C"
              , fontName = "xft:Sarasa UI SC:size=12:antialias=true"
              }

main =  do
  bgState <- newMVar False
  xmobarPipe <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
  xmonad $ ewmh def { terminal           = term
                    , normalBorderColor  = normalBC
                    , modMask            = modM
                    , focusedBorderColor = focusedBC
                    , manageHook         = mHooks
                    , workspaces         = ws
                    , borderWidth        = bw
                    , keys               = xkeys bgState
                    , layoutHook         = lHooks
                    , startupHook        = sHooks
                    , handleEventHook    = hHooks
                    , logHook            = dynamicLogWithPP xmobarPP
                                                       { ppOutput  = hPutStrLn xmobarPipe
                                                       , ppCurrent = xmobarColor "yellow" "" . wrap "[" "]"
                                                       , ppTitle   = xmobarColor "green"  "" . shorten 50
                                                       , ppVisible = wrap "(" ")"
                                                       , ppUrgent  = xmobarColor "red" "yellow"
                                                       }
               }

