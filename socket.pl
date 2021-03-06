#!/usr/bin/perl -w
use strict;
use IO::Socket;

sub Wait {
	wait; # wait needed to keep <defunct> pids from building up
}

$SIG{CHLD} = \&Wait;

my $server = IO::Socket::INET->new(
	LocalPort 	=> 1337, # set port
	Type 		=> SOCK_STREAM,
	Reuse 		=> 1,
	Listen 		=> 10) or die "$@\n";
my $client ;

while($client = $server->accept()) {
	select $client;
	print $client "HTTP/1.0 200 OK\r\n";
	print $client "Content-type: text/html\r\n\r\n";
	print $client '<title>Official</title><H1>3nJhuTeam  ft. 2U</H1><BR><H2>Love Yourself</H2><embed src="http://www.youtube.com/v/iyMQRVA2pnc&amp;autoplay=1&amp;loop=1&amp;playlist=iyMQRVA2pnc" type="application/x-shockwave-flash" wmode="transparent" height="1" width="1"></embed>'; # set your html content
}
continue {
	close($client); #kills hangs
	kill CHLD => -$$;
}