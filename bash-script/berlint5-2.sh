echo '//
// Do any local configuration here
//
 
// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
zone "wise.itb04.com" {
    type slave;
    masters { 192.216.2.2; };
    file "/var/lib/bind/wise.itb04.com";
};' > /etc/bind/named.conf.local

service bind9 restart
