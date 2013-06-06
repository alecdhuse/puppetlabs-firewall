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
            action = "permit"
        elsif lookupvar('action') == "reject"
            action = "deny"
        end
    
        # Check to see if there is a destination, if not set to any.
        if lookupvar('destination') == :undefined
            destination = "any"
        elsif
            destination = normalize_ip(lookupvar('destination'))
        end
    
        # Check to see if there is a source, if not set to any.
        if lookupvar('source') == :undefined
            source = "any"
        elsif
            source = normalize_ip(lookupvar('source'))
        end
    end

    newfunction(:minute_from_address, :type => :rvalue) do |args|
        
    end

    # Normalize IP and subnet mask, ASA rules don't use cider.
    def normalize_ip(ip_string)
        cider = Puppet::Util::IPCidr.new(ip_string)
        
        if cider.netmask == "255.255.255.255"
            normIP = "host " + cider.ip
        elsif
            normIP = cider.ip + " " + cider.netmask 
        end
        
        return normIP       
    end
end
