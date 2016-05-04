package Ashley::Controller::Root;
use Moose;
use YAML::Tiny;
use Data::Dumper;
use Ashley::Form::Contact;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

Ashley::Controller::Root - Root Controller for Ashley

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ($self, $c) = (shift, shift);

    $c->forward(qw/Ashley::Controller::Home index/) unless (defined($c->config->{arrival}));
    $c->forward(qw/Ashley::Controller::Arrival index/);
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;

    my %error = (
        code => 404,
        msg => 'Regrettably, the requested page could not be found.',
    );

    # arrival splash page
    $c->stash(template => 'error/not-found.ttkt.html', error => \%error);
    $c->response->status($error{code});
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Jason McVeigh

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
