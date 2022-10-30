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
www.eden        IN      CNAME   eden.wise.itb04.com.
ns1             IN      A       192.216.3.2 ; IP Berlint
operation       IN      NS      ns1 ' > /etc/bind/wise/wise.itb04.com

echo 'options {
        directory "/var/cache/bind";
 
        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113
 
        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0s placeholder.
       
        // forwarders {
        //      0.0.0.0;
        // };
       
        //=====================================================================$
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //=====================================================================$
        //dnssec-validation auto;
        allow-query{any;};
 
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

service bind9 restart