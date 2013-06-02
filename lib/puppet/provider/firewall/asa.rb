require 'puppet/provider/firewall'
require 'digest/md5'

Puppet::Type.type(:firewall).provide :asa, :parent => Puppet::Provider::Firewall do
  include Puppet::Util::Firewall

  @doc = "ASA type provider"

  has_feature :log_level

  optional_commands({

  })

  defaultfor :ios => :asa

  asa_version = Facter.fact('asa_version').value

  @protocol = "IPv4"

  @resource_map = {
    :destination => "-d",
    :dport => ["-m multiport --dports", "-m (udp|tcp) --dport"],
    :icmp => "-m icmp --icmp-type",
    :iniface => "-i",
    :log_level => "--log-level",
    :name => "-m comment --comment",
    :outiface => "-o",
    :port => '-m multiport --ports',
    :proto => "-p",
    :reject => "--reject-with",
    :source => "-s",
    :sport => ["-m multiport --sports", "-m (udp|tcp) --sport"],
    :tcp_flags => "-m tcp --tcp-flags",
    :todest => "--to-destination",
    :toports => "--to-ports",
    :tosource => "--to-source",
  }


end
