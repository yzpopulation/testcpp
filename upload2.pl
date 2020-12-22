#[webdav] [Local Path] [Regex]
#example perl upload2.pl https://example.webdav.com ./ ".*zip$"
use strict;
use File::Find;
use File::Basename;
use Cwd;
my $pwddir = getcwd;
my $dir="";
my $regex = $ARGV[2];
if ($ARGV[1]=~/^\/.*/){
	$dir=$ARGV[1];
}else{
	$dir=$pwddir."/".$ARGV[1];
}
my @files=();
print "dir: $dir\n";
my $pdi ="";
sub wanted{
	if (-f $File::Find::name){
		if ($File::Find::name =~/$regex/){
			push(@files, $File::Find::name);
		}
	}
}
find(\&wanted,$dir);
my $new_size = @files;
if ($new_size>0){
	my $pid = open(POUT,"| cadaver $ARGV[0]");
	foreach $pdi (@files){
		my ($file,$dir2,$ext) = fileparse($pdi,qr/\.[^.]*/);
		print POUT "put $pdi /".time()."-".$file.$ext." \n";
	}
	print POUT "quit\n";
	close POUT;
}else{
	print "file not find!";
}
