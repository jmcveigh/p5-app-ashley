package Ashley;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory


use constant FN_ABOUT => 'root/data/home/about.yml';
use constant FN_NEWS => 'root/data/home/news.yml';
use constant FN_PLANS => 'root/data/home/plans.yml';
use constant FN_PORTFOLIO => 'root/data/home/portfolio.yml';
use constant FN_QUOTES => 'root/data/home/quotes.yml';
use constant FN_SERVICES => 'root/data/home/services.yml';
use constant FN_SLIDES => 'root/data/home/slides.yml';
use constant FN_STAFF => 'root/data/home/staff.yml';
use constant FN_SUBHEADINGS => 'root/data/home/subheadings.yml';


use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
    CustomErrorMessage
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in ashley.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'Ashley',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
);

__PACKAGE__->config(
    'custom-error-message' => {
        'uri-for-not-found' => '/not-found',
        'error-template' => 'error/error.ttkt.html',
        'content-type' => 'text/html; charset=utf-8',
        'view-name' => 'HTML',
        'response-status' => 500,
    },
);

# Start the application
__PACKAGE__->setup();

=encoding utf8

=head1 NAME

Ashley - Catalyst based application

=head1 SYNOPSIS

    script/ashley_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Ashley::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Jason McVeigh

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
