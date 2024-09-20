       identification division.
       program-id. members_submit.
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
           02 wpassword      pic x(120).
           02 wpasswordrep   pic x(120).
           02 wname          pic x(120).
           02 wphone         pic x(120).
           02 filler         pic x(1460).
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
           move warray(2) to wpassword
           move warray(3) to wpasswordrep 
           move warray(4) to wname
           move warray(5) to wphone 
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
           read members not invalid key
               move "EXISTING MEMBER !!" to wmsgweb
               go stopprogram
           end-read
           move wlogin     to login    
           move wpassword  to password
           move wname      to name 
           move wphone     to phone
           write reg-members.
       stopprogram.
           close members
           move "post"      to wmethod
           move "login.exe" to wexec
           perform openprogram
           stop run
           goback.
       copy "pcd-general.cpy".

