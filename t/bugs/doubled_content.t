use strict;
use warnings;

use Test::More;
use Test::LWP::UserAgent;
use HTTP::Response;

Test::LWP::UserAgent->map_response(
    qr/foo.com/ => HTTP::Response->new(200, 'OK', [ 'Content-type' => 'application/json; charset=utf8' ], '{"success":1}')
);

my $ua = Test::LWP::UserAgent->new();
my $response = $ua->get('http://foo.com/test');
is($response->content, '{"success":1}', 'Content OK');

print $response->as_string;

my $response2 = $ua->get('http://foo.com/test');
is($response2->content, '{"success":1}', 'Content OK');

print $response2->as_string;
done_testing();
