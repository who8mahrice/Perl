#!/usr/local/bin/perl
# from: https://alvinalexander.com/perl/edu/articles/pl020001.shtml

print "Content-type: text/html\n\n";
print "<pre>\n";

foreach $key (sort keys(%ENV)) {
  print "$key = $ENV{$key}<p>";
}
print "</pre>\n";
