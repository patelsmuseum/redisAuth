#!perl
#
# This file is part of Redis
#
# This software is Copyright (c) 2015 by Pedro Melo, Damien Krotkine.
#
# This is free software, licensed under:
#
#   The Artistic License 2.0 (GPL Compatible)
#

BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    print qq{1..0 # SKIP these tests are for testing by the author\n};
    exit
  }
}

# This file was automatically generated by Dist::Zilla::Plugin::MetaTests.

use Test::CPAN::Meta;

meta_yaml_ok();
