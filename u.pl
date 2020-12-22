use strict;
my $pid = open(POUT,"| cadaver $ARGV[0]");
print POUT "put /home/runner/work/yzpopulation/testcpp/hello.cpp\n /"
print POUT "quit\n";
close POUT;
