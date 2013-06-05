# These hashes allow us to iterate across a series of test data
# creating rspec examples for each parameter to ensure the input :line
# extrapolates to the desired value for the parameter in question. And
# vice-versa

# This hash is for testing a line conversion to a hash of parameters
# which will be used to create a resource.
ARGS_TO_HASH = {
  'long_rule_1' => {
    :line => '-A INPUT -s 1.1.1.1/32 -d 1.1.1.1/32 -p tcp -m multiport --dports 7061,7062 -m multiport --sports 7061,7062 -m comment --comment "000 allow foo" -j ACCEPT',
    :table => 'filter',
    :compare_all => true,
    :params => {
      :action => "accept",
      :chain => "INPUT",
      :destination => "1.1.1.1/32",
      :dport => ["7061","7062"],
      :ensure => :present,
      :line => '-A INPUT -s 1.1.1.1/32 -d 1.1.1.1/32 -p tcp -m multiport --dports 7061,7062 -m multiport --sports 7061,7062 -m comment --comment "000 allow foo" -j ACCEPT',
      :name => "000 allow foo",
      :proto => "tcp",
      :provider => "iptables",
      :source => "1.1.1.1/32",
      :sport => ["7061","7062"],
      :table => "filter",
    },
  },

}
