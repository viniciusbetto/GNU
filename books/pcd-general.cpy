       openprogram.
           perform mount-msg.
           copy 'header_html.cpy'.
           display 
               '<body onload="document.form.submit()">'
               '<form name="form" method="' wmethod '" action="' wexec '">'
               '</form>'
           end-display.
           copy "footer_html.cpy".
       mount-msg.
           if wmsgweb not = spaces then
               perform varying windex from 100 by -1 until 
               wmsgweb(windex:1) > spaces or windex = 1
                  initialize wtmpmsg    
               end-perform
               move wmsgweb to wtmpmsg
               String '<script language="javascript">'
               delimited by size 'alert("'
               delimited by size wtmpmsg(1:windex)
               delimited by size '");</script>'
               delimited by size into wmsgweb
           end-if.
     