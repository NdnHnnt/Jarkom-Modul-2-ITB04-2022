echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      wise.itb04.com.
@               IN      A       192.216.2.2
www             IN      CNAME   wise.itb04.com.
@               IN      AAAA    ::1
eden            IN      A       192.216.3.3
www.eden        IN      CNAME   eden.wise.itb04.com.' >  /etc/bind/wise/wise.itb04.com

service bind9 restart