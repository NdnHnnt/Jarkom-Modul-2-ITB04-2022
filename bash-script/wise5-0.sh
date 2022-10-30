echo '//
// Do any local configuration here
//
 
// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
zone "wise.itb04.com" {
    type master;
    notify yes;
    also-notify { 192.216.3.2; };
    allow-transfer { 192.216.3.2; };
    file "/etc/bind/wise/wise.itb04.com";
};
zone "2.216.192.in-addr.arpa" {
    type master;
    file "/etc/bind/wise/2.216.192.in-addr.arpa";
};' >  /etc/bind/named.conf.local

service bind9 restart
