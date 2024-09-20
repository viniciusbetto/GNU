       identification division.
       program-id. home.
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
       procedure division.
           display 
               "Content-type: text/html"
               newline
           end-display
           copy "header_html.cpy".
           copy "menu_html.cpy".
           open input members
           if fstatus not equal zeros
               string "ERRO ABRINDO members: " fstatus
                   delimited by size into wmsgweb
           end-if
           copy "home1_html.cpy".
           read members next
           perform until fstatus = "10"
               copy "home2_html.cpy".
               read members next
           end-perform.
           copy "home3_html.cpy".
           copy "footer_html.cpy".
           close members.
           stop run.
