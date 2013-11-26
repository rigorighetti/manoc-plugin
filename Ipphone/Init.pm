# Copyright 2011 by the Manoc Team
#
# This library is free software. You can redistribute it and/or modify
# it under the same terms as Perl itself.
package Manoc::Plugin::Ipphone::Init;

use Manoc::Search::QueryType;

sub load{
  my $self = shift;
  
  Manoc::_add_plugin("ipphone", {type => 'search'});

}

1;
