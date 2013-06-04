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
    :log_level  => "log",
    :port       => "eq",
    :reject     => "deny",
    :sport      => "eq",
  }

  @resource_list = [:type, :access-list, :line, :extended, :action, :protocol, :source, :sport, :destination, :dport, :log]   

end
