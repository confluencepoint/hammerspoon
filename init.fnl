(global config
 {
   'applications'
   {
     'Kitty'
     {
      'identifier' 'Kitty'
      'hyper_shortcut' 'j'
      'preferred_display' 1
     }

     'Google Chrome'
     {
      'identifier' 'Google Chrome'
      'hyper_shortcut' 'k'
      'preferred_display' 1
     }

    'Dash'
    {
      'identifier' 'Dash'
      'hyper_shortcut' 'h'
    }

    'Slack'
    {
      'identifier' 'Slack'
      'hyper_shortcut' 'i'
      'preferred_display' 2
      'distraction' true
    }

    'Microsoft Outlook' {
      'identifier' 'Microsoft Outlook'
      'hyper_shortcut' 'e'
      'preferred_display' 2
      'distraction' true
    }

    'Finder' {
      'identifier' 'Finder'
      'hyper_shortcut' 'f'
    }

    'Discord' {
      'identifier' 'Discord'
      'hyper_shortcut' 'l'
      'preferred_display' 2
      'distraction' true
    }

    'zoom.us' {
      'identifier' 'zoom.us'
      'hyper_shortcut' 'z'
      'preferred_display' 2
    }

    'Sketch' {
      'identifier' 'Sketch'
      'hyper_shortcut' 'v'
      'preferred_display' 1
    }
   }

   ; Hyper+key for all the below are handled in some other software
   ; "fall through".
   'hyper_fall_through' {
     'c', 'space', '\\', 'p', '\'', 't'
   }
 }
)

(local hyper (require 'hyper'))

(require 'autolayout')
(require 'movewindows')
(require 'pomodoro')

; reload hammerspoon
(: hyper :bind {}, 'r', nil, (fn [] (: hs :reload)))
