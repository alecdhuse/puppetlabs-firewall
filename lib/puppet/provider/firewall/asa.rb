require 'puppet/provider/firewall'
require 'digest/md5'

Puppet::Type.type(:firewall).provide :asa, :parent => Puppet::Provider::Firewall do
  include Puppet::Util::Firewall

  @doc = "ASA type provider"

  has_feature :log_level

  defaultfor :ios => :asa

  asa_version = Facter.fact('asa_version').value

  @protocol = "IPv4"

  @resource_map = {
    :acl            => "",  
    :destination    => "",
    :dport          => "",
    :log_level      => "log",
    :port           => "eq",
    :proto          => "",
    :reject         => "deny",
    :source         => "",  
    :sport          => "eq"
  }

  @resource_list = [:type, :access-list, :line, :extended, :action, :protocol, :source, :sport, :destination, :dport, :log]   

    def create_asa_rule()
        access-list = "access-list"
    
        # Format the action to ASA language
        if lookupvar('action') == "accept"
            rule_action = "permit"
        elsif lookupvar('action') == "reject"
            rule_action = "deny"
        end
    
        # Check to see if there is a destination, if not set to any.
        if lookupvar('destination') == :undefined
            rule_destination = "any"
        elsif
            rule_destination = normalize_ip(lookupvar('destination'))
        end
    
        # Check to see if there is a source, if not set to any.
        if lookupvar('source') == :undefined
            rule_source = "any"
        elsif
            rule_source = normalize_ip(lookupvar('source'))
        end
        
        # Convert port numbers to Cisco port protocol names.  
        # This is not nessesary to execute the commands, 
        # but when testing we need to know what how the command will be be stored on the ASA.        
        rule_protocol = lookupvar('proto')
        rule_sport    = lookupvar('sport')
        rule_dport    = lookupvar('dport')
        
        if rule_protocol.downcase == "icmp"
            rule_sport = Puppet::Util::asa.icmp_number_to_name(rule_sport)
            rule_dport = Puppet::Util::asa.icmp_number_to_name(rule_dport)
        elsif rule_protocol.downcase == "ip"
            # No port info fo ip
        elsif rule_protocol.downcase == "tcp"
            rule_sport = Puppet::Util::asa.tcp_port_number_to_name(rule_sport)
            rule_dport = Puppet::Util::asa.tcp_port_number_to_name(rule_dport)
        elsif rule_protocol.downcase == "udp"
            rule_sport = Puppet::Util::asa.udp_port_number_to_name(rule_sport)
            rule_dport = Puppet::Util::asa.udp_port_number_to_name(rule_dport)
        else
            rule_sport = ""
            rule_dport = ""           
        end
        
        # Prepend " eq " to port name
        if rule_sport != ""
            rule_sport = " eq " + rule_sport
            
        if rule_dport != ""
            rule_dport = " eq " + rule_dport            
        
        rule_type     = "access-list"
        rule_extended = "extended"
        
        rule = rule_type + " " + lookupvar('acl') + " " + rule_extended + " " + rule_action + " " + rule_protocol + " " + rule_source + rule_sport + " " + rule_destination + rule_dport
    end
    
    def normalize_ip(ip_string)
        # Normalize IP and subnet mask; ASA rules don't use cider.
        
        cider = Puppet::Util::IPCidr.new(ip_string)
        
        if cider.netmask == "255.255.255.255"
            normIP = "host " + cider.to_string
        elsif
            normIP = cider.to_string + " " + cider.netmask 
        end
        
        return normIP       
    end
end
