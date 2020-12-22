use strict;
use File::Find;
use File::Basename;
my $dir= $ARGV[1];
print "$dir\n";
my $pdi ="";
sub wanted{
	if (-f $File::Find::name){
		if ($File::Find::name =~/.*\.cpp$/){
			print "$File::Find::name\n";
			$pdi = $File::Find::name;
		}
	}
}
find(\&wanted,$dir);
if ($pdi){
	my ($file,$dir2,$ext) = fileparse($pdi,qr/\.[^.]*/);
	my $pid = open(POUT,"| cadaver $ARGV[0]");
	print POUT "put $pdi\n /".time().$file;
	print POUT "quit\n";
	close POUT;
}else{
	print "file not find!";
}
