package My::JustTesting;

use Exporter qw(import);
use Carp qw| croak |;
use Cwd qw| getcwd |;
use File::Path qw| mkpath rmtree |;
use File::Copy;
# use IO::Tee;

# use constant CACHEDIR => '/var/cache/httpd/billstar';
use constant CACHEDIR => 'C://var/cache/httpd/billstar';
 
our @EXPORT_OK = qw(goodbye setword);
# /var/cache/httpd/billstar/intranet.datafoundry.com:443/cgi-bin/query_BDB3516.pl/1725/invall=0/e258127/temp.html

sub new {
    my $proto = shift;
    my $class = ref($proto) || $proto;
    my $self = {};
    my $cachedir = CACHEDIR;
    # $cachedir .= '/' ."intranet.datafoundry.com:443";
    #$cachedir .= '/' ."cgi-bin/query_BDB3516.pl";

    $self->{CACHE}      = $cachedir;
    $self->{MSG}        = "hi";
    $self->{NAME}       = "Ky";
    $self->{TEMP}       = "/Temp";
    $self->{FILENAME}   = undef;
    $self->{DIRECT}     = undef;

    unless ( -d $cachedir ) {
    my @paths = mkpath( $cachedir );
    croak( "unable to create cache directory '$cachedir'" )
      unless scalar( @paths );
    }
    #bless($self, shift);
    #return bless(\$self, $class);
    bless($self, $class);
    return $self;
}

sub new_file($$) {
  my ( $this, $file ) = @_;
  if ( $file =~ /\// ) {
    my $dir = $file;
    $dir =~ s/\/[^\/]*$//;
    $this->{TEMP} = $dir;
    unless ( -d "$this->{CACHE}/$dir" ) {
      my @paths = mkpath( "$this->{CACHE}/$dir" );
      croak( "unable to create sub directory '$dir'" )
        unless scalar( @paths );
    }
  }
 open( FILE, ">$this->{CACHE}/$file" ) || croak( $! );
  return \*FILE;
}

sub finish($$$) {
    my($this, $old_fh, $new_file) = @_;
    my $new_file_dir = $new_file;
    my $old_file_dir = $old_fh;
    
    if ( $new_file =~ /\// ) {
    $new_file_dir =~ s/\/[^\/]*$//;
    }
    print "New file is: $new_file_dir\n";
    chdir "$this->{CACHE}/$this->{TEMP}";
    print "In tempdir: $this->{CACHE}/$this->{TEMP}\n";
    copy("temp.html","render.html");
    move("render.html","$this->{CACHE}/$new_file" )  or die "Failed to move $this->{CACHE}/$new_file $!\n";
    $old_fh ->close();
    unlink("temp.html") or die "Cannot unlink file, error: $!";
    chdir "$this->{CACHE}/$new_file_dir";
    print "Changed dir to: $this->{CACHE}/$new_file_dir\n";
    rmtree( "$this->{CACHE}/$this->{TEMP}" ) or die "Cannot rmtree '$this->{CACHE}/$this->{TEMP}' : $!";
}

sub getName {
    $self = shift;
    return $self->{FILENAME};
}

sub setName {
    my ($self, $name) = @_;
    $self->{NAME} = $name;
}

sub goodbye {
    print "Goodbye.\n";
}

sub setword {
    my $self = shift;
    if (@_) { $self->{MSG} = shift };
    return  $self->{MSG};
}

sub goodbye2 {
    print "Goodbye 2 you\n";
}

sub goodbye3 {
    my $self = shift;
   #print "My message: $self->{MSG} \n";
}

sub DESTROY {
    my ($self) = @_;
    print "DESTROY: ", $self->{NAME},"\n";
};

1;
