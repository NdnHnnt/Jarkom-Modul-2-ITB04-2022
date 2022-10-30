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
zone "2.216.192.in-addr.arpa" {
    type master;
    file "/etc/bind/wise/2.216.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/wise/2.216.192.in-addr.arpa

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                        	  2 	    ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.216.192.in-addr.arpa. IN      NS      wise.itb04.com.
2                       IN      PTR     wise.itb04.com.' > /etc/bind/wise/2.216.192.in-addr.arpa

service bind9 restart