       identification division.
       program-id. login.
       environment division.
       data division.
       working-storage section.
       copy "wk-general.cpy".
       procedure division.
           display 
              "Content-type: text/html"
               newline
           end-display
           copy "header_html.cpy".
           copy "login_html.cpy".
           copy "footer_html.cpy".
           stop run.
