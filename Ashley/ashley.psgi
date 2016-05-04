use strict;
use warnings;

use Ashley;

my $app = Ashley->apply_default_middlewares(Ashley->psgi_app);
$app;