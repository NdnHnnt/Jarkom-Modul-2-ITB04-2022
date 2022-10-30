echo '//
// Do any local configuration here
//
 
// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
zone "wise.itb04.com" {
        type master;
        file "/etc/bind/wise/wise.itb04.com";
};
' > /etc/bind/named.conf.local

mkdir -p /etc/bind/wise

cp /etc/bind/db.local /etc/bind/wise/wise.itb04.com

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
@       IN      NS      wise.itb04.com.
@       IN      A       192.216.2.2
www    IN      CNAME   wise.itb04.com.
@       IN      AAAA    ::1

' > /etc/bind/wise/wise.itb04.com

service bind9 restart