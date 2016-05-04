package Ashley::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.ttkt.html',
    INCLUDE_PATH => [
        Ashley->path_to('root','src'),
    ],
    TIMER => 0,
    WRAPPER => 'wrapper.ttkt.html',
    render_die => 1,
);

=head1 NAME

Ashley::View::HTML - TT View for Ashley

=head1 DESCRIPTION

TT View for Ashley.

=head1 SEE ALSO

L<Ashley>

=head1 AUTHOR

Jason McVeigh

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
