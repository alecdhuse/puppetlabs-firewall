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
        source = lookupvar('source')
    end

    newfunction(:minute_from_address, :type => :rvalue) do |args|
        
    end
end
