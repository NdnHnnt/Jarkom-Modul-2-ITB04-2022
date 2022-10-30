echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     operation.wise.itb04.com. root.operation.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      operation.wise.itb04.com.
@               IN      A       192.216.3.3
www             IN      CNAME   operation.wise.itb04.com.
strix           IN      A       192.216.3.3
www.strix       IN      CNAME   strix.operation.wise.itb04.com.
@       	    IN      AAAA    ::1
' > /etc/bind/operation/operation.wise.itb04.com

service bind9 restart