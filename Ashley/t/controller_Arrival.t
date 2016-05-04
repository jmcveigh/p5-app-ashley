use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Ashley';
use Ashley::Controller::Arrival;

ok( request('/arrival')->is_success, 'Request should succeed' );
done_testing();
