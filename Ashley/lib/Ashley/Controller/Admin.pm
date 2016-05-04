package Ashley::Controller::Admin;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Ashley::Controller::Admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body('Unauthorized.');
}

sub install_default_values :Path('/admin/install-default-values') :Args(0) {
    my ($self, $c) = @_;

    my $yaml1 = YAML::Tiny->new({ slides => [
        {
            heading => 'Lorem ipsum',
            subheading => 'Dolor sit amet.',
        },
        {
            heading => 'Ultricies eros',
            subheading => 'Non consequat magna fermentum ac.',
        },
        {
            heading => 'Maximus sed',
            subheading => 'Gravida ultrices erat.',
        },
    ]});

    unlink(Ashley::FN_SLIDES) if (-e Ashley::FN_SLIDES);
    $yaml1->write(Ashley::FN_SLIDES);

    my $yaml2 = YAML::Tiny->new({ quotes => [
        {
            quote => 'Write drunk; edit sober.',
            source => 'Ernest Hemingway',
            icon => 'icon-beer',
        },
        {
            icon => 'icon-desktop',
            quote => 'I <i class="icon-heart-filled"></i> what I do and I hope you do too!',
        },
        {
            quote => 'Write drunk; edit sober.',
            source => 'Ernest Hemingway',
            icon => 'icon-wine',
        },
        {
            icon => 'icon-mobile',
            quote => 'I <i class="icon-heart-filled"></i> what I do and I hope you do too!',
        },
    ]});

    unlink(Ashley::FN_QUOTES) if (-e Ashley::FN_QUOTES);
    $yaml2->write(Ashley::FN_QUOTES);

    my $yaml3 = YAML::Tiny->new({ subheadings => [
        '<strong>Cras ut ultricies eros.</strong><a href="#">Nulla imperdiet semper molestie.</a>',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'Nullam scelerisque id nunc nec volutpat.',
        'Etiam pellentesque tristique arcu, non consequat magna fermentum ac.',
        '<strong>Cras ut ultricies eros.</strong><a href="#">Nulla imperdiet semper molestie.</a>',
        'Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed.',
        'Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat.',
    ]});

    unlink(Ashley::FN_SUBHEADINGS) if (-e Ashley::FN_SUBHEADINGS);
    $yaml3->write(Ashley::FN_SUBHEADINGS);

    my $yaml4 = YAML::Tiny->new({
        news => [
            {
                photo => '/static/images/news/news1.jpg',
                headline => 'Lorem ipsom dolar sit amet.',
                date => 'March 1',
                more => '#',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            },
            {
                photo => '/static/images/news/news1.jpg',
                headline => 'Lorem ipsom dolar sit amet.',
                date => 'March 2',
                more => '#',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            },
            {
                photo => '/static/images/news/news1.jpg',
                headline => 'Lorem ipsom dolar sit amet.',
                date => 'March 3',
                more => '#',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            },
            {
                photo => '/static/images/news/news1.jpg',
                headline => 'Lorem ipsom dolar sit amet.',
                date => 'March 4',
                more => '#',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            },
            {
                photo => '/static/images/news/news1.jpg',
                headline => 'Lorem ipsom dolar sit amet.',
                date => 'March 5',
                more => '#',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            },
            {
                photo => '/static/images/news/news1.jpg',
                headline => 'Lorem ipsom dolar sit amet.',
                date => 'March 6',
                more => '#',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            },
        ],
    });

    unlink(Ashley::FN_NEWS) if (-e Ashley::FN_NEWS);
    $yaml4->write(Ashley::FN_NEWS);

    my $yaml5 = YAML::Tiny->new({ services => [
        {
            heading => 'Lorem ipsum dolor sit amet.',
            short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            icon => 'icon-wine',
        },
        {
            heading => 'Lorem ipsum dolor sit amet.',
            short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            icon => 'icon-beer',
        },
        {
            heading => 'Lorem ipsum dolor sit amet.',
            short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            icon => 'icon-wine',
        },
        {
            heading => 'Lorem ipsum dolor sit amet.',
            short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            icon => 'icon-beer',
        },
        {
            heading => 'Lorem ipsum dolor sit amet.',
            short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            icon => 'icon-wine',
        },
        {
            heading => 'Lorem ipsum dolor sit amet.',
            short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            icon => 'icon-beer',
        },
        {
            heading => 'Lorem ipsum dolor sit amet.',
            short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            icon => 'icon-wine',
        },
        {
            heading => 'Lorem ipsum dolor sit amet.',
            short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;',
            icon => 'icon-beer',
        },
    ]});

    unlink(Ashley::FN_SERVICES) if (-e Ashley::FN_SERVICES);
    $yaml5->write(Ashley::FN_SERVICES);

    my $yaml6 = YAML::Tiny->new({ staff => [
        {
            photo => '/static/images/team/pic1.jpg',
            position => 'Executive Director',
            given => 'Jesse',
            sur => uc('Doe'),
            email => 'jdoe@gsc-orillia.org',
            facebook => 'http://www.facebook.com/',
            twitter => 'http://www.twitter.com/',
            googleplus => 'http://plus.google.com/',
            linkedin => 'http://www.linkedin.com/',
        },
        {
            photo => '/static/images/team/pic1.jpg',
            position => 'Accountant / Controller',
            given => 'Joann',
            sur => uc('Doe'),
            email => 'jdoe@gsc-orillia.org',
            facebook => 'http://www.facebook.com/',
            twitter => 'http://www.twitter.com/',
            googleplus => 'http://plus.google.com/',
            linkedin => 'http://www.linkedin.com/',
        },
        {
            photo => '/static/images/team/pic1.jpg',
            position => 'Graphic Designer',
            given => 'Julie',
            sur => uc('Doe'),
            email => 'jdoe@gsc-orillia.org',
            facebook => 'http://www.facebook.com/',
            twitter => 'http://www.twitter.com/',
            googleplus => 'http://plus.google.com/',
            linkedin => 'http://www.linkedin.com/',
        },
        {
            photo => '/static/images/team/pic1.jpg',
            position => 'Programmer',
            given => 'Justin',
            sur => uc('Doe'),
            email => 'jdoe@gsc-orillia.org',
            facebook => 'http://www.facebook.com/',
            twitter => 'http://www.twitter.com/',
            googleplus => 'http://plus.google.com/',
            linkedin => 'http://www.linkedin.com/',
        },
    ]});

    unlink(Ashley::FN_STAFF) if (-e Ashley::FN_STAFF);
    $yaml6->write(Ashley::FN_STAFF);

    my $yaml7 = YAML::Tiny->new({
        about => {
            heading1 => 'Lorem ipsom dolar sit amet.',
            content1 => '<p>Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;</p>',
            heading2 => 'Lorem ipsom dolar sit amet.',
            content2 => '<p>Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;</p>',
        },
    });

    unlink(Ashley::FN_ABOUT) if (-e Ashley::FN_ABOUT);
    $yaml7->write(Ashley::FN_ABOUT);

    my $yaml8 = YAML::Tiny->new({
        classes => [
            {
                tag => 'vimeo',
                name => 'Vimeo',
            },
            {
                tag => 'lorem',
                name => 'Lorem',
            },
            {
                tag => 'morbi',
                name => 'Morbi',
            },
        ],
        items => [
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'lorem',
                image => '/static/images/portfolio/vign3.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Lorem ipsum dolar sit amet.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'vimeo',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => 'http://vimeo.com/ondemand/5335/75660130',
                icon => 'icon-video',
                vimeo => 'http://vimeo.com/ondemand/5335/75660130',
                headline => 'Vimeo Video',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'lorem',
                image => '/static/images/portfolio/vign3.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Lorem ipsum dolar sit amet.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'lorem',
                image => '/static/images/portfolio/vign3.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Lorem ipsum dolar sit amet.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'lorem',
                image => '/static/images/portfolio/vign3.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Lorem ipsum dolar sit amet.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'lorem',
                image => '/static/images/portfolio/vign3.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Lorem ipsum dolar sit amet.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'lorem',
                image => '/static/images/portfolio/vign3.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Lorem ipsum dolar sit amet.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'lorem',
                image => '/static/images/portfolio/vign3.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Lorem ipsum dolar sit amet.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'lorem',
                image => '/static/images/portfolio/vign3.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Lorem ipsum dolar sit amet.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
            {
                tag => 'morbi',
                image => '/static/images/portfolio/vign7.jpg',
                anchor => '#',
                icon => 'icon-photo',
                headline => 'Nunc ut tellus sollicitudin placerat.',
                short => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate nunc ut tellus sollicitudin placerat. ',
            },
        ],
    });

    unlink(Ashley::FN_PORTFOLIO) if (-e Ashley::FN_PORTFOLIO);
    $yaml8->write(Ashley::FN_PORTFOLIO);

    my $yaml9 = YAML::Tiny->new({ plans => [
        {
            focus => '1',
            name => 'Free',
            price => '0.00',
            recurrence => 'per month',
            points => [
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                'Nullam scelerisque id nunc nec volutpat.',
                'Cras ut ultricies eros.',
                'Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros.',
            ],
            button => '<a class="btn btn-lg" href="#">REGISTER</a>',
        },
        {
            name => 'Silver',
            price => '10.00',
            recurrence => 'per month',
            points => [
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                'Nullam scelerisque id nunc nec volutpat.',
                'Cras ut ultricies eros.',
                'Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros.',                
            ],
            button => '<a class="btn btn-lg" href="#">REGISTER</a>',
        },
        {
            name => 'Gold',
            price => '25.00',
            recurrence => 'per month',
            points => [
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                'Nullam scelerisque id nunc nec volutpat.',
                'Cras ut ultricies eros.',
                'Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros.',                
            ],
            button => '<a class="btn btn-lg" href="#">REGISTER</a>',
        },
        {
            name => 'Platinum',
            price => '40.00',
            recurrence => 'per month',
            points => [
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                'Nullam scelerisque id nunc nec volutpat.',
                'Cras ut ultricies eros.',
                'Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros.',                
            ],
            button => '<a class="btn btn-lg" href="#">REGISTER</a>',
        },
    ]});

    unlink(Ashley::FN_PLANS) if (-e Ashley::FN_PLANS);
    $yaml9->write(Ashley::FN_PLANS);

    $c->response->body('Defaults written to datafile.');
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
