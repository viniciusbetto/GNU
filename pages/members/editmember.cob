       identification division.
       program-id. editmember.
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
       01  wrecebemethod pic x(256) value spaces.
       01  wrecebetype   pic x(256) value spaces.
       01  wrecebestring pic x(256) value spaces.
       copy "wk-general.cpy".
       01  wscreen-received  pic x(2000).
       01  filler redefines wscreen-received. 
           02 wlogin         pic x(60).
           02 filler         pic x(1940).
       copy "lnk-general.cpy".
       procedure division.
           display 
               "Content-type: text/html"
               newline
           end-display
           call "characteres".
           call "receivescreen" using warrayconvert.
           move warray(1) to wlogin    
      *>---------------------------------------------------------
           open input members
           if fstatus not equal zeros
               string "ERR OPEN members: " fstatus
                   delimited by size into wmsgweb
           end-if
           move wlogin to login
           read members invalid key
               initialize reg-members
               move "LOGIN NOT FOUND !!" to wmsgweb
           end-read
           copy "header_html.cpy".
           copy "menu_html.cpy".
           copy "editmember_html.cpy".
           copy "footer_html.cpy".
           close members
           stop run.
           copy "pcd-general.cpy".
