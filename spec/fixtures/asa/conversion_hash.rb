# These hashes allow us to iterate across a series of test data
# creating rspec examples for each parameter to ensure the input :line
# extrapolates to the desired value for the parameter in question. And
# vice-versa

# This hash is for testing a line conversion to a hash of parameters
# which will be used to create a resource.
ARGS_TO_HASH = {
    'permit_udp_53' => {
        :line        => 'access-list access_in extended permit udp host 8.8.8.8 eq domain any',
        :compare_all => true,
        :params => {
            :acl         => 'access_in',
            :action      => 'accept',
            :proto       => 'udp',
            :source      => '8.8.8.8',
            :sport       => '53',
            :destination => 'any',        
        },
    },
    'deny_ip_subnet_1' => {
        :line        => 'access-list access_in extended deny ip 192.168.0.0 255.255.0.0 any ',
        :compare_all => true,
        :params => {
            :acl         => 'access_in',
            :action      => 'reject',
            :proto       => 'ip',
            :source      => '192.168.0.0/16',
            :destination => 'any',        
        },
    },
    'permit_tcp_3389_in' => {
        :line        => 'access-list access_in extended permit tcp any host 10.100.25.100 eq 3389',
        :compare_all => true,
        :params => {
            :acl         => 'access_in',
            :action      => 'accept',
            :proto       => 'tcp',
            :source      => 'any',            
            :destination => '10.100.25.100',        
            :dport       => '3389',
        },
    },    
    'deny_all_in' => {
        :line        => 'access-list access_in extended deny ip any any ',
        :compare_all => true,
        :params => {
            :acl         => 'access_in',
            :action      => 'reject',
            :proto       => 'ip',
            :source      => 'any',            
            :destination => 'any',        
        },
    },    
    
    'allow_all_out' => {
        :line        => 'access-list access_out extended permit ip any any ',
        :compare_all => true,
        :params => {
            :acl         => 'access_out',
            :action      => 'accept',
            :proto       => 'ip',
            :source      => 'any',            
            :destination => 'any',          
        },
    },    
}
