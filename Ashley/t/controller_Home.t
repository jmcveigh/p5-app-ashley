use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Ashley';
use Ashley::Controller::Home;

ok( request('/home')->is_success, 'Request should succeed' );
done_testing();
