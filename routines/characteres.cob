       identification division.
       program-id. characteres.
       environment division.
       input-output section.
       file-control.
           copy "keyboard.sel".
       data division.
       file section.
           copy "keyboard.cpy".
       working-storage section.
       copy "wk-general.cpy".
       linkage section.
       copy "lnk-general.cpy".
       procedure division.
      *> cobol-lint CL002 starting
       starting.
           exit program.
       entry "receivescreen" using warrayconvert.
           perform varying windex from 1 by 1 until windex > witensscreen
               initialize warray(windex)
           end-perform
           open input webinput
           if fstatus not = zeros
               exit program 
           end-if
           read webinput at end
               display "Saindo Final"  "<br>"
           end-read
           if screen-received = spaces
               exit program
           end-if
           inspect screen-received converting "<>&" to "   "
           initialize wpositioni wpositionf 
           move 1 to wqtarray
      *> We separate the fields received into an array
           perform varying windex from 1 by 1 until windex > 2000 
                    or screen-received(windex:10) = spaces
               if screen-received(windex:1) = "="
                   move windex to wpositioni
                   add 1 to wpositioni      
                   move zeros to wpositionf             
               end-if
               if screen-received(windex:1) = " "
                   move screen-received(wpositioni:wpositionf) 
                       to warray(wqtarray)
                   add 1 to wqtarray
               end-if
               add 1 to wpositionf
           end-perform
           move screen-received(wpositioni:wpositionf) to warray(wqtarray)
           close webinput.
      *>     display "CONVERSÃO:" "<br>"
      *>     display "1-" warray(1) "<br>"
      *>     display "2-" warray(2) "<br>"
      *>     display "3-" warray(3) "<br>"
      *>     display "4-" warray(4) "<br>"
      *>     display "5-" warray(5) "<br>"
      *>     display "6-" warray(6) "<br>"
      *>     display "7-" warray(7) "<br>"
      *>     display "8-" warray(8) "<br>".
      *> We convert special characters from received fields     
           perform varying wqtarray from 1 by 1 until wqtarray > 120 or
                      warray(wqtarray) = spaces
               move warray(wqtarray) to wk-field
               perform convert-field
               move wk-field to warray(wqtarray)
           end-perform
           exit program.
       convert-field.
           inspect wk-field replacing all "+" by " "
           initialize wfield
           move 1 to witen
           perform varying windex from 1 by 1 until windex > 120 or
                           wk-field(windex:10) = spaces
               evaluate wk-field(windex:3)
                   when "%60" move "`" to  wfield(witen:1)
                   add 2 to windex
                   when "%60" move "`" to wfield(witen:1)
                   add 2 to windex
                   when "%7E" move "~" to wfield(witen:1)
                   add 2 to windex
                   when "%5E" move "^" to wfield(witen:1)
                   add 2 to windex
                   when "%5C" move "\" to wfield(witen:1)
                   add 2 to windex
                   when "%5D" move "]" to wfield(witen:1)
                   add 2 to windex
                   when "%7B" move "{" to wfield(witen:1)
                   add 2 to windex
                   when "%7D" move "}" to wfield(witen:1)
                   add 2 to windex
                   when "%21" move "!" to wfield(witen:1)
                   add 2 to windex
                   when "%7C" move "|" to wfield(witen:1)
                   add 2 to windex
                   when "%3C" move "<" to wfield(witen:1)
                   add 2 to windex
                   when "%3E" move ">" to wfield(witen:1)
                   add 2 to windex
                   when "%25" move "%" to wfield(witen:1)
                   add 2 to windex
                   when "%2F" move "/" to wfield(witen:1)
                   add 2 to windex
                   when "%3B" move ";" to wfield(witen:1)
                   add 2 to windex
                   when "%3F" move "?" to wfield(witen:1)
                   add 2 to windex
                   when "%3A" move ":" to wfield(witen:1)
                   add 2 to windex
                   when "%40" move "@" to wfield(witen:1)
                   add 2 to windex
                   when "%26" move "&" to wfield(witen:1)
                   add 2 to windex
                   when "%3D" move "=" to wfield(witen:1)
                   add 2 to windex
                   when "%22" move '"' to wfield(witen:1)
                   add 2 to windex
                   when "%24" move "$" to wfield(witen:1)
                   add 2 to windex
                   when "%2C" move "," to wfield(witen:1)
                   add 2 to windex
                   when "%27" move "'" to wfield(witen:1)
                   add 2 to windex
                   when "%2B" move "+" to wfield(witen:1)
                   add 2 to windex
                   when "%28" move "(" to wfield(witen:1)
                   add 2 to windex
                   when "%29" move ")" to wfield(witen:1)
                   add 2 to windex
                   when "%23" move "#" to wfield(witen:1)
                   add 2 to windex
                   when other
                       move wk-field(windex:1) to wfield(witen:1)
               end-evaluate
               add 1 to witen
           end-perform
           move wfield to wk-field.
