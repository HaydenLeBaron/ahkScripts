;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HAYDEN'S WINDOWS 10 CONFIG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SetCapsLockState,  AlwaysOff ; disable CapsLock

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;
;; NOTES
;;;;;;;;;;

;; DESIGN GOALS
; 1. minimize collisions with existing keyboard shortcuts (this means no using Ctrl)
; 2. 

;; MOD KEYS
; Capslock -- for window management
; AppsKey -- for launching apps
; <! (Left ALt) -- for cursor movement


;;;;;;;;;;
;; TEST
;;;;;;;;;;


;;;;;;;;;;
;; SIMPLE KEY REMAPS
;;;;;;;;;;


;;;;;;;;;;
;; KEYBOARD CURSOR NAVIGATION
;;;;;;;;;;


;; Move cursor once
<!j:: Send {Left}
<!;:: Send {Right}
<!l:: Send {Up}
<!k:: Send {Down}

;; Move cursor by word (lr) / 5 lines (ud)
^<!j:: Send ^{Left}
^<!`;:: Send ^{Right}
^<!l:: Send {Up}{Up}{Up}{Up}{Up}
^<!k:: Send {Down}{Down}{Down}{Down}{Down}

;; Move cursor once -- while highlighting
+<!j:: Send +{Left}
+<!;:: Send +{Right}
+<!l:: Send +{Up}
+<!k:: Send +{Down}

;; Move cursor by word (lr) / 5 lines (ud) -- while highlighting
^+<!j:: Send ^+{Left}
^+<!;:: Send ^+{Right}
^+<!l:: Send ^+{Up}
^+<!k:: Send ^+{Down}

;; Move cursor to beginning/end of line/page
<!h:: Send {Home}						
<!':: Send {End}
<!,:: Send ^{End}			
<!o:: Send ^{Home}

;; Move cursor to beginning/end of line/page -- while highlighting
<!+h:: Send +{Home}
<!+':: Send +{End}
<!+,:: Send ^+{End}			
<!+o:: Send ^+{Home}


;;;;;;;;;;
;; WINDOW MANAGEMENT
;;;;;;;;;;

;;; SNAP WINDOWS ;;;
;; Snap current window left
CapsLock & j::Send {LWin down}{Left}
CapsLock & j Up::Send {LWin up}{Left}
;; Snap current window right
CapsLock & `;::Send {LWin down}{Right}
CapsLock & `; Up::Send {LWin up}{Right}
;; Snap current window down
CapsLock & k::Send {LWin down}{Down}
CapsLock & k Up::Send {LWin up}{Down}
;; Snap current window up
CapsLock & l::Send {LWin down}{Up}
CapsLock & l Up::Send {LWin up}{Up}

;;; CYCLE WINDOWS ;;;
;; cycle left a window (less recent) // TODO: figure out a way to display window raphic
CapsLock & u::Send {Alt down}+{Tab}
CapsLock & u Up::Send {Alt up}+{Tab}
;; cycle right a window (more recent) // TODO: make both forms of cycle match
CapsLock &  p::Send !{Tab}

;;; OTHER ;;;
CapsLock & x:: Send !{F4} ;; Close the current window
CapsLock & d:: Send #d ;; Show desktop


;;;;;;;;;;
;; Launch Macros
;;;;;;;;;;

;; TODO: for apps: check to see if the app is open. If so, navigate to that app. Else open a new instance of the app.

;; NOTE on web browsers
;;
;; Different browsers are used for different kinds of service to make it easier to find the right
;; browser window when managing windows, and also to make it easier for rescuetime to categorize time.
;;
;; Firefox -- used for standalone productive "apps". e.g: gmail, todoist, google calendar, rescuetime, etc
;; Firefox Developer -- used to launch productive sites that are not standalone apps. e.g.: canvas
;; Chrome -- used to launch neutral productivity things 


;; firefox-dev := "C:\Program Files\Firefox Developer Edition\firefox.exe" TODO: use variables for default browsers.

;; Launch Run
AppsKey:: Send #r

;; Launch windows _T_erminal
AppsKey & t::
    Run, wt.exe
    ;TODO: add `WinWait, windowTitle`
    WinActivate
    return
;; Launch _B_rowser
AppsKey & b::Run, C:\Program Files\Firefox Developer Edition\firefox.exe

;; Launch _I_nstructure canvas
AppsKey & i::
    Send #r
    WinWait, Run
    ;; TODO: replace with browser variable
    Send C:\Program Files\Firefox Developer Edition\firefox.exe https://utah.instructure.com/?login_success=1{Enter}
    return

;; Launch google _C_alendar
AppsKey & c::
    Send #r
    WinWait, Run
    Send firefox https://calendar.google.com/calendar/ {Enter}
    return

;; Launch to_D_oist
AppsKey & d::
    Send #r
    WinWait, Run
    Send firefox todoist.com {Enter}
    return

;; Launch _M_essages
AppsKey & m::
    Send #r
    WinWait, Run
    Send firefox https://messages.google.com/web/conversations{Enter}
    return

;; Launch _V_s code
AppsKey & v::
    Send #r
    WinWait, Run
    Send code{Enter}
    return

;;;;;;;;;;
;; OTHER
;;;;;;;;;;

^+Escape::
    ExitApp
    return


