use strict;
use File::Find;
use File::Basename;
use Cwd;
my $pwddir = getcwd;
my $dir= $pwddir."/".$ARGV[1];
print "$dir\n";
my $pdi ="";
sub wanted{
	if (-f $File::Find::name){
		print "$File::Find::name\n";
		if ($File::Find::name =~/.*\.zip$/){
			$pdi = $File::Find::name;
		}
	}
}
find(\&wanted,$dir);
if ($pdi){
	print "find file $pdi";
	my ($file,$dir2,$ext) = fileparse($pdi,qr/\.[^.]*/);
	my $pid = open(POUT,"| cadaver $ARGV[0]");
	print POUT "put $pdi /".time().$file." \n";
	print POUT "quit\n";
	close POUT;
}else{
	print "file not find!";
}
