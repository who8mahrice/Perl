#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd qw(cwd);


my $dir = "D:\\Legend of Fuyao (1080p)";

if (chdir, "$dir"){
	chdir("$dir") or die "cannot change: $!\n"; # change to dir to rename the files
	my $cwd = cwd;
	#print "Current dir is $cwd"; # uncomment this to see if it is the correct dir.
	opendir (DIR, $dir);
	my @file_list = readdir DIR;
	foreach my $oldname(@file_list) {
		next if( $oldname eq '.' || $oldname eq '..' ); # skips the '.' and '..' in dir since I was getting errors about replacing the . and ..
		my $newname = $oldname;
		$newname =~ s/STRING_TO_REPLACE/REPLACED_STRING/; # string search and replace here.

		print "Oldname: $oldname     Newname: $newname"."\n"; # print to see if it looks good. 
		#If it looks good comment out the print here and uncomment the rename below.

		#rename $oldname, $newname or die "Can't rename $oldname to $newname: $!";
	}
} else {
    print "Error - Please check that $dir exists and is accessible.\n"
}
closedir (DIR);
