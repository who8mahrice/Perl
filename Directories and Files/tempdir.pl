#!/usr/bin/env perl

use Cwd;
use File::Temp;

# Remember the current directory
my $oldcwd = getcwd;
# Create a temporary directory
my $dir = File::Temp->newdir;
# Go to the temporary directory
chdir $dir;

# ... do your stuff, create files in the temporary directory ...

# Go back to the previous directory
chdir $oldcwd;

# The temporary directory will be deleted when the program exits
