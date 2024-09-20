       78  newline          value x'0A'.
       78  witensscreen     value 120.
       01  fstatus.
           10 fstatus-1     pic x(01) value spaces.
           10 fstatus-2     pic x(01) value spaces.
           10 fstatus-r redefines fstatus-2 pic x(001) comp-x.       
       01  windex           pic 9(09) value zeros.
       01  witen            pic 9(04) value zeros.
       01  wpositioni       pic 9(03) value zeros.
       01  wpositionf       pic 9(03) value zeros.
       01  wqtarray         pic 9(03) value zeros.
       01  wfield           pic x(120) value spaces.
       01  wexec            pic x(20) value spaces.
       01  wmethod          pic x(04) value "post".
       01  wmsgweb          pic x(200) value spaces.
       01  wtmpmsg          pic x(100) value spaces.
       01  wk-field         pic x(120) value spaces.
