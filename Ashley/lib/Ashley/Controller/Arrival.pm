package Ashley::Controller::Arrival;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Ashley::Controller::Arrival - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    if (defined($c->config->{arrival})) {
        my %arrival;
        ($arrival{Y}, $arrival{M}, $arrival{D}, $arrival{h}, $arrival{m}, $arrival{s}) = ($c->config->{arrival} =~ /^(\d\d\d\d)\/(\d\d)\/(\d\d)\s(\d\d)\:(\d\d)\:(\d\d)$/);

        # arrival splash page
        $c->stash(template => 'arrival/arrival.ttkt.html', arrival => \%arrival);
    }
}



=encoding utf8

=head1 AUTHOR

Jason McVeigh

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
