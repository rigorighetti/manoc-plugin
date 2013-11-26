# Copyright 2011 by the Manoc Team
#
# This library is free software. You can redistribute it and/or modify
# it under the same terms as Perl itself.
package Manoc::Plugin::Ipphone::Init;

use Manoc::Search::QueryType;

my $BAD_VERSION = '1.98';

sub check_ver {
  my $self = shift;
  
  return Manoc->VERSION >= $BAD_VERSION;
}

sub load{
  my $self = shift;
  
  check_ver() and 
  Manoc::_add_plugin("ipphone", {type => 'search'});

}

1;
