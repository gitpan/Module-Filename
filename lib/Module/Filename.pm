package Module::Filename;
use strict;
use Path::Class qw{file};
our $VERSION = '0.01';

=head1 NAME

Module::Filename - Returns the filename for a given module

=head1 SYNOPSIS

  use Module::Filename;
  my $filename=Module::Filename->new->filename("strict");

=head1 DESCRIPTION

=head1 USAGE

=head1 CONSTRUCTOR

=head2 new

  my $mf=Module::Filename->new();

=cut

sub new {
  my $this = shift();
  my $class = ref($this) || $this;
  my $self = {};
  bless $self, $class;
  $self->initialize(@_);
  return $self;
}

=head1 METHODS

=cut

sub initialize {
  my $self = shift();
  %$self=@_;
}

=head2 filename

Returns the first filename that matches the module in the @INC path array.

  my $filename=Module::Filename->new->filename("strict");

=cut

sub filename {
  my $self=shift;
  my $module=shift or die("Error: Module name required.");
  my $file=file(split("::", $module.".pm"));
  my $return=undef;
  foreach my $path (@INC) {
    my $filename=file($path,  $file);
    if (-f $filename) {
     $return=$filename;
     last; #return the first match in @INC
    }
  }
  return $return;
}

=head1 BUGS

Submit to RT and email author.

=head1 SUPPORT

Try author.

=head1 AUTHOR

    Michael R. Davis
    CPAN ID: MRDVT
    STOP, LLC
    domain=>michaelrdavis,tld=>com,account=>perl
    http://www.stopllc.com/

=head1 COPYRIGHT

This program is free software licensed under the...

	The BSD License

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

L<pmpath>, L<Module::Info> constructor=>new_from_module, method=>file, L<Module::InstalledVersion> property=>"dir", L<Module::Locate> method=>locate, L<Module::Util> method=>find_installed

=cut

1;
