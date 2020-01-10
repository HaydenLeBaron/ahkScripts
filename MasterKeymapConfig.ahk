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
; mod key 1: Capslock
; mod key 2: <! (Left ALt)

;;;;;;;;;;
;; TEST
;;;;;;;;;;


;; Test AppsKey
AppsKey::MsgBox, AHK: You just hit the apps key!

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
^<!;:: Send ^{Right}
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
<!o+:: Send ^+{Home}


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


;;;;;;;;;;
;; Launch Macros
;;;;;;;;;;

;; Launch windows _T_erminal
^<!t::
    Run, wt.exe
    ;TODO: add `WinWait, windowTitle`
    WinActivate
    return
;; Launch _B_rowser
^<!b::Run, firefox.exe

;; Launch _I_nstructure canvas
^<!i::
    Send #r
    WinWait, Run
    Send https://go.utah.edu/cas/login?service=https`%3A`%2F`%2Fincommon2.sso.utah.edu`%2Fidp`%2FAuthn`%2FExtCas`%3Fconversation`%3De4s1&entityId=http`%3A`%2F`%2Futah.instructure.com`%2Fsaml2 {Enter}
    return

;; Launch google _C_alendar
^<!c::
    Send #r
    WinWait, Run
    Send firefox https://calendar.google.com/calendar/ {Enter}
    return


;;;;;;;;;;
;; OTHER
;;;;;;;;;;

^+Escape::
    ExitApp
    return


