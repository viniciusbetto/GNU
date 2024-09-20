       identification division.
       program-id. editmember_submit.
       environment division.
       configuration section.
       special-names.  
           decimal-point is comma.
       input-output section.
       file-control.
           copy "members.sel".
       data division.
       file section.
       copy "members.cpy".
       working-storage section.
       copy "wk-general.cpy".
       01  wscreen-received  pic x(2000).
       01  filler redefines wscreen-received.
           02 wlogin         pic x(60).
           02 wname          pic x(120).
           02 wphone         pic x(120).
           02 wopcao         pic x(06).
           02 filler         pic x(1694).
       copy "lnk-general.cpy".
       procedure division.
           display 
              "Content-type: text/html"
               newline
           end-display       
           initialize wmsgweb
           call "characteres".
           call "receivescreen" using warrayconvert.
           move warray(1) to wlogin    
           move warray(2) to wname
           move warray(3) to wphone 
           move warray(4) to wopcao

      *>    display "RETORNO:" "<br>"
      *>    display "1-" warray(1) "<br>"
      *>    display "2-" warray(2) "<br>"
      *>    display "3-" warray(3) "<br>"
      *>    display "4-" warray(4) "<br>"
      *>    display "5-" warray(5) "<br>"
      *>    display "6-" warray(6) "<br>"
      *>    display "7-" warray(7) "<br>"
      *>    display "8-" warray(8) "<br>".

      *>---------------------------------------------------------
      *> INICIANDO A GRAVAÇÃO
           open i-o members
           if fstatus = "35"
               open output members
               close members
               open i-o members
           end-if
           if fstatus not equal zeros
               string "ERR OPEN members: " fstatus
                   delimited by size into wmsgweb
               go stopprogram 
           end-if
           move wlogin to login
           read members invalid key
               move "NOT EXISTING MEMBER !!" to wmsgweb
               go stopprogram
           end-read.
           if wopcao = "write" then
               move wname      to name 
               move wphone     to phone
               rewrite reg-members
           else
               if wopcao = "delete" then
                   perform exclude thru fexclude
               end-if
           end-if
           if fstatus not = zeros then
               string "ERROR OPERATION. FS:  " fstatus
               delimited by size into wmsgweb
           end-if.
      stopprogram.
           close members
           move "post"      to wmethod
           move "home.exe" to wexec
           perform openprogram
           stop run
           goback.
       exclude.
           display '<scrpit>javascript:alert("CONFIRM EXCLUDE MEMBER ?)</script>'.
       fexclude.
           exit.
       copy "pcd-general.cpy".

