package Ashley::Controller::Home;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Ashley::Controller::Home - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ($self, $c) = @_;

    # load slides
    my $path_slides = 'root/data/home/slides.yml';
    if (-e $path_slides) {
        my $slides = YAML::Tiny->read($path_slides);
        $c->stash(slides => \@{$slides->[0]->{slides}});
    }

    # load quotes
    my $path_quotes = 'root/data/home/quotes.yml';
    if (-e $path_quotes) {
        my $quotes = YAML::Tiny->read($path_quotes);
        $c->stash(quotes => \@{$quotes->[0]->{quotes}});
    }

    # load subheadings
    my $path_subheadings = 'root/data/home/subheadings.yml';
    if (-e $path_subheadings) {
        my $subheadings = YAML::Tiny->read($path_subheadings);
        $c->stash(subheadings => \@{$subheadings->[0]->{subheadings}});
    }

    # load news
    my $path_news = 'root/data/home/news.yml';
    if (-e $path_news) {
        my $news = YAML::Tiny->read($path_news);
        $c->stash(news1 => \%{$news->[0]->{news}->[-1]}, news2 => \%{$news->[0]->{news}->[-2]}, news3 => \%{$news->[0]->{news}->[-3]});
    }

    # load services
    my $path_services = 'root/data/home/services.yml';
    if (-e $path_news) {
        my $services = YAML::Tiny->read($path_services);
        $c->stash(services => \@{$services->[0]->{services}}, services_count => scalar(@{$services->[0]->{services}}));
    }

    # load staff
    my $path_staff = 'root/data/home/staff.yml';
    if (-e $path_staff) {
        my $staff = YAML::Tiny->read($path_staff);
        $c->stash(staff => \@{$staff->[0]->{staff}});
    }

    # load about
    my $path_about = 'root/data/home/about.yml';
    if (-e $path_about) {
        my $about = YAML::Tiny->read($path_about);
        $c->stash(about => \%{$about->[0]->{about}});
    }

    # load portfolio
    my $path_portfolio = 'root/data/home/portfolio.yml';
    if (-e $path_portfolio) {
        my $portfolio = YAML::Tiny->read($path_portfolio);
        $c->stash(portfolio_classes => \@{$portfolio->[0]->{classes}},portfolio_items => \@{$portfolio->[0]->{items}});
    }

    # load plans
    my $path_plans = 'root/data/home/plans.yml';
    if (-e $path_plans) {
        my $plans = YAML::Tiny->read($path_plans);
        $c->stash(plans => \@{$plans->[0]->{plans}});
    }

    $c->stash(template => 'home/home.ttkt.html');

    my $contact_form = Ashley::Form::Contact->new;
    $c->stash(contact_form => $contact_form);
    if (defined($c->req->param('contact'))) {
        $contact_form->process(params => $c->req->params);
        return unless $contact_form->validated();
        my $contact_message = $c->model('ContactItem')->new($c->req->params);

        # serialize model
        $contact_message->serialize;

        $c->response->redirect($c->uri_for($self->action_for('contact_success')));
    }
}

sub contact_success :Path('contact-success') :Args(0){
    my ($self, $c) = @_;

    $c->stash(template => 'home/contact-success.ttkt.html');
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
