       identification division.
       program-id. login_submit.
       environment division.
       input-output section.
       file-control.
      *>    copy "keyboard.sel".
           copy "members.sel".
       data division.
       file section.
      *>copy "keyboard.cpy".
       copy "members.cpy".
       working-storage section.
       copy "wk-general.cpy".
       copy "lnk-general.cpy".
       01  wscreen-received   pic x(2000).
       01  filler redefines wscreen-received.
           02 wlogin         pic x(60).
           02 wpassword      pic x(120).
           02 filler         pic x(1820).
       procedure division.
           display 
               "Content-type: text/html; charset=utf-8"
               newline
           end-display
           initialize wmsgweb
           call "characteres".
           call "receivescreen" using warrayconvert.
           move warray(1) to wlogin    
           move warray(2) to wpassword
           open input members
           if fstatus not equal zeros
               string "ERRO ABRINDO MEMBROS: " fstatus 
               delimited by size into wmsgweb
               go stopprogram
           end-if
           move wlogin to login
           read members invalid key 
               move "MEMBER NOT FOUND !!" to wmsgweb
               close members
               go stopprogram
           end-read
           if password <> wpassword then
               move "MEMBER NOT FOUND !!" to wmsgweb
               close members
               go stopprogram
           end-if
           close members
      *> CRIANDO VARIAVELS DE SEÇÃO
           
           move "post" to wmethod
           move "home.exe" to wexec
           perform openprogram.
           stop run.
       stopprogram.
           move "post" to wmethod
           move "login.exe" to wexec
           perform openprogram.
           stop run.
       copy "pcd-general.cpy".
           
           
           
