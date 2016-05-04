package Ashley::Model::ContactItem;
use Moose;
use Mail::Mailer;
use feature 'say';

extends 'Catalyst::Model';

use namespace::autoclean;

has 'name' => (
    is => 'rw',
    isa => 'Str',
    default => sub { "" },
);

has 'email' => (
    is => 'rw',
    isa => 'Str',
    default => sub { "" },
);

has 'phone' => (
    is => 'rw',
    isa => 'Str',
    default => sub { "" },
);

has 'comments' => (
    is => 'rw',
    isa => 'Str',
    default => sub { "" },
);

sub serialize {
    my $self = shift;
    my $mailer;


    $mailer = Mail::Mailer->new('smtp', Server => Ashley->config->{smtp_server}, Auth => [ Ashley->config->{smtp_user}, Ashley->config->{smtp_password} ]) if (Ashley->config->{smtp_server} && Ashley->config->{smtp_user} && Ashley->config->{smtp_password});
    $mailer = Mail::Mailer->new('smtp', Server => Ashley->config->{smtp_server}) if (Ashley->config->{smtp_server});
    $mailer = Mail::Mailer->new('sendmail') unless (Ashley->config->{smtp_server});

    $mailer->open( {
        From => Ashley->config->{webmin},
        To => Ashley->config->{webmin},
        Subject => Ashley->config->{subject},
    }) or die "Can't open; $!\n";
    print "sending mail...\n";
    print $mailer $self->comments;
    $mailer->close();
}

__PACKAGE__->meta->make_immutable;

1;