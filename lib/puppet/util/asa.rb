module Puppet::Util::Asa
    
    # Cisco ios translatesport numbers of common ports to their protocol name.
    # See http://www.cisco.com/en/US/docs/security/asa/asa81/config/guide/ports.html
    # This method translates protocol numbers into their symbolic port names.  
    # If no port matches, use the port number passed in.     
    def eth_protocol_number_to_name(protocol_number)
        case protocol_number                                                                        
            when "0"    then "ip"
            when "1"    then "icmp"
            when "4"    then "ipinip"
            when "2"    then "igmp"
            when "6"    then "tcp"
            when "9"    then "igrp"  
            when "17"   then "udp"
            when "47"   then "gre"
            when "50"   then "esp"
            when "51"   then "ah"
            when "58"   then "icmp6"
            when "88"   then "eigrp"
            when "89"   then "ospf"
            when "94"   then "nos"
            when "103"  then "pim"
            when "108"  then "pcp"
            when "109"  then "snp"                                    
            else protocol_number
        end
    end
    
    # Cisco ios translatesport numbers of common ports to their protocol name.
    # See http://www.cisco.com/en/US/docs/security/asa/asa81/config/guide/ports.html
    # This method translates icmp numbers into their symbolic names.  
    # If no name matches, use the number passed in.    
    def icmp_number_to_name(number)
        case number
            when "0"    then "echo-reply"
            when "3"    then "unreachable"
            when "4"    then "source-quench"
            when "5"    then "redirect"
            when "6"    then "alternate-address"
            when "8"    then "echo"
            when "9"    then "router-advertisement"
            when "10"   then "router-solicitation"
            when "11"   then "time-exceeded"
            when "12"   then "parameter-problem"
            when "13"   then "timestamp-request"
            when "14"   then "timestamp-reply"
            when "15"   then "information-request"
            when "16"   then "information-reply"
            when "17"   then "mask-request"
            when "18"   then "mask-reply"
            when "31"   then "conversion-error"
            when "32"   then "mobile-redirect"
            else number
        end
    end
    
    # Cisco ios translatesport numbers of common ports to their protocol name.
    # See http://www.cisco.com/en/US/docs/security/asa/asa81/config/guide/ports.html
    # This method translates tcp port numbers into their symbolic port names.  
    # If no port matches, use the port number passed in.
    def tcp_port_number_to_name(port_number)
        case port_number                                                          
            when "7"    then "echo"
            when "9"    then "discard"            
            when "13"   then "daytime"
            when "19"   then "chargen"
            when "20"   then "ftp-data"
            when "21"   then "ftp"
            when "22"   then "ssh"
            when "23"   then "telnet"
            when "25"   then "smtp"
            when "43"   then "whois"
            when "49"   then "tacacs"
            when "53"   then "domain"              
            when "70"   then "gopher"
            when "79"   then "finger"
            when "80"   then "http"
            when "88"   then "kerberos"
            when "101"  then "hostname"
            when "109"  then "pop2"
            when "110"  then "pop3"
            when "111"  then "sunrpc"
            when "113"  then "ident"
            when "119"  then "nntp"
            when "139"  then "netbios-ssn"
            when "143"  then "imap4"
            when "179"  then "bgb"
            when "194"  then "irc"
            when "389"  then "ldap"
            when "443"  then "https"
            when "496"  then "pim-auto-rp"
            when "512"  then "exec"
            when "513"  then "login"
            when "514"  then "cmd" 
            when "515"  then "lpd"
            when "517"  then "talk"
            when "540"  then "uucp"
            when "543"  then "klogin"
            when "544"  then "kshell"
            when "554"  then "rtsp"
            when "636"  then "ldaps"
            when "750"  then "kerberos"
            when "1352" then "lotusnotes"
            when "1494" then "citrix-ica"
            when "1522" then "sqlnet"
            when "1720" then "h323"
            when "1723" then "pptp"
            when "2049" then "nfs"
            when "2748" then "ctiqbe"  
            when "3020" then "cifs"
            when "5060" then "sip"
            when "5120" then "aol"                                                                                                                         
            when "5631" then "pcanywhere-data"                                                                                                                                                                                     
            else port_number
        end
    end
    
    # Cisco ios translatesport numbers of common ports to their protocol name.
    # See http://www.cisco.com/en/US/docs/security/asa/asa81/config/guide/ports.html
    # This method translates udp port numbers into their symbolic port names.  
    # If no port matches, use the port number passed in.    
    def udp_port_number_to_name(port_number)
        case port_number   
            when "7"    then "echo"
            when "9"    then "discard"  
            when "37"   then "time"
            when "42"   then "nameserver"
            when "49"   then "tacacs"
            when "53"   then "domain"  
            when "67"   then "bootps"
            when "68"   then "bootpc"
            when "69"   then "tftp"
            when "111"  then "sunrpc"
            when "123"  then "ntp"
            when "137"  then "netbios-ns"
            when "138"  then "netbios-dgm"
            when "195"  then "dnsix"
            when "161"  then "snmp"
            when "162"  then "snmptrap"
            when "117"  then "xdmcp"
            when "434"  then "mobile-ip"
            when "496"  then "pim-auto-rp"
            when "512"  then "biff"
            when "513"  then "who"
            when "514"  then "syslog"
            when "517"  then "talk"
            when "520"  then "rip"
            when "750"  then "kerberos"
            when "1645" then "radius"
            when "1646" then "radius-acct"
            when "5510" then "secureid-udp"
            when "5632" then "pcanywhere-status"
            else port_number
        end
    end
        
end