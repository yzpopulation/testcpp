use strict;
my $pid = open(POUT,"| cadaver $ARGV[0]");
print POUT "put hello.cpp\n";
print POUT "quit\n";
close POUT;
