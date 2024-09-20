# APACHE create directories
#--------------------------
- Create /apache24/conf/alias
- Create /cgi-bin/gnu
- Create /cgi-bin/gnu/scripts
- Create /cgi-bin/gnu/img
- Create /cgi-bin/gnu/data


# APACHE - httpd.conf
#--------------------
# Enable CGI module in Apache
LoadModule cgi_module modules/mod_cgi.so

#Include at the end of httpd.conf
Include conf/alias/meus.conf

#Create my.conf in /apache24/conf/alias
#Content:
Alias /scripts/ "C:/Apache24/cgi-bin/gnu/scripts/"
<Directory "C:/Apache24/cgi-bin/gnu/scripts/">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride all
    Require all granted
</Directory>
Alias /img/ "C:/Apache24/cgi-bin/gnu/img/"
<Directory "C:/Apache24/cgi-bin/gnu/img/">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride all
    Require all granted
</Directory>

