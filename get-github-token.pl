#!/usr/bin/env perl
use v5.10;
use strict;
use warnings;

use Net::GitHub::V3;
use IO::Prompt::Tiny qw/prompt/;

print "Be sure to delete your existing token if you've not written it down\n";
print "You can remove it here https://github.com/settings/tokens\n\n";

my $user = prompt( "Github username:" );
my $pass = prompt( "Github password:" );
my $gh = Net::GitHub::V3->new( login => $user, pass => $pass );
my $oauth = $gh->oauth;
use Data::Dumper;

my $o = eval { $oauth->create_authorization( {
    scopes => ['user', 'public_repo', 'repo', 'gist'],
    note   => 'Net::GitHub',
} ) };

#print "ERROR: $@\n";
#print Dumper $oauth;
#print Dumper $o;
say $o->{token};
