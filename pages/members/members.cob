       identification division.
       program-id. members.
       environment division.
       data division.
       working-storage section.
       copy "wk-general.cpy".
       procedure division.
           display 
               "Content-type: text/html; charset=utf-8"
               newline
           end-display
           copy "header_html.cpy".
           copy "members_html.cpy".
           copy "footer_html.cpy".
           stop run.
