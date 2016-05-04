#!/bin/perl

use strict;
use warnings;

package AshleyArtGenApp {
    use Moose;

    use feature 'say';
    use feature 'state';
    no warnings 'qw';

    use constant FN_LOGO => 'root/static/images/main-logo.png';

    use Image::Magick;
    use Getopt::Long;

    use namespace::autoclean;

    has 'out' => (
        is => 'ro',
        isa => 'Image::Magick',
        default => sub { Image::Magick->new },
        required => 1,
    );

    sub main {
        my $self = shift;
        my ($name, $font, $geom, $size);

        GetOptions(
            'name=s' => \$name,
            'font=s' => \$font,
            'geom=s' => \$geom,
            'size=s' => \$size,
        );

        die("Usage -- arguments include : name, geom, font and size but all arguments are required arguments; example exec : (script/ashley_artgen.pl --name='Company.' --geom='195x48' --font='root/data/Roboto-Bold.ttf' --size='42') \n") unless(defined($name) && defined($geom) && defined($font) && defined($size));
       
        $self->out->Set(size => $geom);
        $self->out->Set(font => $font);
        $self->out->Read('xc:transparent');
        my @p = split(/x/,$geom);

        $self->out->Annotate(
            pointsize => $size,
            fill => '#40404093',
            text => $name,
            gravity => 'NorthWest',
            align => 'center',
            x => $p[0] / 2 - 2,
            y => $p[1] - 12,
        );

        $self->out->Write(FN_LOGO);
    }

    __PACKAGE__->meta->make_immutable;
}

AshleyArtGenApp->new->main unless caller;

1;