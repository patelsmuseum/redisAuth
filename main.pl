#!/usr/bin/perl

use strict;
use warnings;
use Redis;

# Redis server connection details
my $redis_host = '127.0.0.1';
my $redis_port = 6379;
my $username   = 'default';
my $password   = '';

# Create a new Redis connection
my $redis = Redis->new(
    server => "$redis_host:$redis_port",
);


# Authenticate using ACL credentials
my $auth_result = $redis->auth($username, $password);


# Check if authentication was successful
if ($auth_result eq 'OK') {
    print "Connected to Redis successfully!\n";
} else {
    die "Failed to authenticate to Redis: $auth_result\n";
}

my $ping_response;
eval {
    $ping_response = $redis->ping;
};

# Check if the connection is successful
if (!$@ and defined $ping_response) {
    if ($ping_response eq 'PONG') {
        print "Connection test successful!\n";
    } else {
        die "Failed to connect to Redis: Unexpected ping response: $ping_response\n";
    }
} elsif ($@) {
    die "Error during ping: $@\n";
} else {
    die "Failed to connect to Redis: $ping_response\n";
}

# Close the Redis connection
$redis->quit;