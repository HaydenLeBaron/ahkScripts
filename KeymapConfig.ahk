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
; mod key 3: Tab (NOTE: The tab character is now with `Left` [Left Arrow Key])

;; MOD CHANNELS
; 1
; 2
; 3
; 12
; 23
; 13
; 123

;;;;;;;;;;
;; TEST
;;;;;;;;;;

; ^Capslock::
;     Send hello world
;     return

::^Capslock::
    Send got to go
    return

; <!j:: 
;     Send {Left} 
;     return
; <!;:: 
;     Send {Right}  
;     return
; <!l:: 
;     Send {Up} 
;     return
; <!k:: 
;     Send {Down} 
;     return

<!j:: Send {Left}
<!;:: Send {Right}
<!l:: Send {Up}
<!k:: Send {Down}

^<!j:: Send ^{Left}
^<!;:: Send ^{Right}
^<!l:: Send ^{Up}
^<!k:: Send ^{Down}

+<!j:: Send +{Left}
+<!;:: Send +{Right}
+<!l:: Send +{Up}
+<!k:: Send +{Down}

^+<!j:: Send ^+{Left}
^+<!;:: Send ^+{Right}
^+<!l:: Send ^+{Up}
^+<!k:: Send ^+{Down}

<!h:: Send {Home}			; move cursor left to BEGINNING of LINE
							; move cursor down to BOTTOM of PAGE
							; move cursor up to TOP of PAGE
<!':: Send {End}			; move cursor right to END of LINE

<!+h:: Send +{Home}
<!+':: Send +{End}





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


;;; WINDOW MANAGEMENT NOTE: WM handled by CapsLock
;; Snap current window left
CapsLock & j::Send {LWin down}{Left}
CapsLock & j Up::Send {LWin up}{Left}
; CapsLock & j:: ;; TODO: removeme
;     Send #{Left}
;     return



;; Snap current window right
CapsLock & `;::Send {LWin down}{Right}
CapsLock & `; Up::Send {LWin up}{Right}
; ;; Snap current window right // TODO: removeme
; CapsLock & `;::
;     Send #{Right}
;     return


;; Snap current window up
CapsLock & l::Send {LWin down}{Up}
CapsLock & l Up::Send {LWin up}{Up}

; CapsLock & l:: // TODO: removeme
;     Send #{Up}
;     return

;; Snap current window down
CapsLock & k::Send {LWin down}{Down}
CapsLock & k Up::Send {LWin up}{Down}

; CapsLock &  k:: ;; TODO: removeme
;     Send #{Down}
;     return

;; cycle left a window (less recent)
CapsLock & u::Send {Alt down}+{Tab}
CapsLock & u Up::Send {Alt up}+{Tab}

;; cycle right a window (more recent)
CapsLock &  p::Send !{Tab}






;;;;;;;;;;
;; KEYBOARD CURSOR NAVIGATION
;;;;;;;;;;



;;; CHARACTER-LEVEL NAVIGATION
; move cursor left once
; move cursor right once
; move cursor up once
; move cursor down once

;;; WORD-LEVEL NAVIGATION
; move cursor left to BEGINNING of WORD
; move cursor right to END of WORD
; move cursor up 5 lines
; move cursor down 5 lines

;;; LINE/PAGE-LEVEL NAVIGATION
; move cursor left to beginning of line
; move cursor right to end of line
; move cursor up to top of page
; move cursor down to bottom of page



;;;;;;;;;;
;; OTHER
;;;;;;;;;;

^+Escape::
    ExitApp
    return


