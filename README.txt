These are the scripts I use everyday to make my computer behave exactly how I want it to.
Some of these scripts have been modified from Taran Van Hemert: https://www.youtube.com/channel/UCd0ZD4iCXRXf18p3cA7EQfg
Others are original or modifications of other scripts I have found.

I will now briefly explain each script:

Alt Acceleration Disabler:

In just about any Windows application, pressing (and releasing!) the ALT key will highlight the menu bar in a special way, where pressing a letter key immediately after, (Like F) will result in the menu being opened. Further keystrokes will bring you even deeper into the menu. This is called "menu acceleration."
So, ALT I R will make a new row in excel, and ALT R C will make a new comment in Word... stuff like that. You only have to press one key at a time, and the key combo still works. 
Because this system allows you to completely release the ALT key before pressing the next keystrokes, it means that ALT is not really a modifier key... it's an obligatory STICKY KEY. https://en.wikipedia.org/wiki/Sticky_keys
So, in applications that treat the ALT key as a modifier, like Photoshop, you sometimes end up activating the menus when you don't want to! (And there's no reason to use menu acceleration anyway, since Photoshop already allows you to bind those actions to custom shortcuts.)
This script disables this unwanted functionality from windows!

Always On Top:

This allows you to keep a window always above the others (even when deselected) by pressing a hotkey (ctrl + alt + space by default)
  
Audio Fix:

This script changes the default audio devices and locks the recording device to a specific volume (92% by default)
The paths and audio device names in this script will need to be modified to fit your setup, Nircmd is also required to be installed.
  
Creative Helper:

This script adds custom hotkeys to Houdini and Photoshop
It also enables snipping tool when Windows + s is pressed and immediatly starts a snip

Dvorak:
Changes the input to Dvorak except when holding ctrl alt or win. It also sets CapsLock to backspace.
To toggle back to qwerty press Insert.

Easy Window Dragging:

Easy Window Dragging enables you to move, resize, close, maximize and minimize windows easily, by holding the windows key
or the F20 key (I have F20 mapped to my mouse) and one of the 5 buttons on a standard 5 button mouse.
The shortcuts:
Win/F20 + Left Button  : Drag to move a window.
Win/F20 + Right Button : Drag to resize a window.
Win/F20 + Mouse Back   : Minimize a window.
Win/F20 + Mouse Forward: Maximize/Restore a window.
Win/F20 + Middle Button: Close a window.

Easy Window Organiser:

--------> WinGetPosEx.ahk IS REQUIRED FOR THIS SCRIPT TO RUN. <--------

The same as Easy Window Dragging but it also adds moving and resizing windows to preset locations though hotkeys on the numpad. This script will need to be highly adapted if you dont use a 3440x1440 monitor.

Firefox/Chrome Keyboard:

--------> VA.ahk IS REQUIRED FOR THIS SCRIPT TO RUN. <--------

My magnum opus and the script I use the most. FF Keyboard enables you to use FireFox (or can be modified to Chrome) in the background!
Holding down the menu/appskey (key to the right of the right windows key (https://en.wikipedia.org/wiki/Menu_key) press appskey + capslock to toggle) you can press any key and have it
sent to FireFox or Chrome! This enables you to browse the interenet, change YouTube videos and much more without tabbing out of fullsceen applications such as games!
(Rarely a game will require you to reload the script after opening it to work, GTA V is the only example i've come across)
When used in conjunction with the Vimium browser extension (firefox: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/ chrome: https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
it becomes extremely easy to use and much more convinient than tabbing out!
NEW FEATURE: Hold ctrl and use the volume keys/wheel to change the volume of firefox/vlc/plex in the windows mixer. Hold AppsKey and use the volume keys/wheel to control the volume of the application that is currently focused in the same way, including games!
Use the AppsKey with the numpad to set to a specific volume ie AppsKey+Numpad1 = 10% volume.

Firefox/Chrome Keyboard Barebones:

VA.ahk is NOT required for this version of the script.
This version of the script has hotkeys specific to my computer removed, such as using the numpad to change volume. This stuff can work on your pc but requires you to customize the script for your pc and also needs extra programs such as nircmd.

Internet Assistant:

Select a word or phrase and press a hotkey to search it on the internet.
Win+G searches on google.
Win+Shift+D defines on google.
Win+T translates on google translate.
Win+Shift+T searches on thesaurus.com.
Win+U searches on urban dictionary.
Win+W opens the wikipedia article.
Win+Shift+W searches on wikipedia.
RAlt+Capslock toggles SaRcAsM tExT.

Launch Audio Fix:

This simply opens audio fix while hiding the command prompt window.
  
Volume Changer:

This enables hotkeys to change the volume for spotify, enables the media keys to work in vlc and makes scroll lock work as a mute toggle.
If modified it will work for chrome but not firefox for some reason. But I only use this script for vlc and the mute toggle so I didn't really look into it. I don't use this script anymore.
  
Volume Equaliser:
  
This script resets the windows volume mixer, making all applications audio back to full. I don't recommend running on startup.
I have it setup as an app in the start menu and whenever I need to reset the mixer I'll run it.

Thank you for looking at my scripts, I hope they are useful.

Mitchell Thomas.
