#---------------------------------------------------------------------
package Dist::Zilla::Plugin::ArchiveRelease;
#
# Copyright 2010 Christopher J. Madsen
#
# Author: Christopher J. Madsen <perl@cjmweb.net>
# Created:  6 Mar 2010
#
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See either the
# GNU General Public License or the Artistic License for more details.
#
# ABSTRACT: Move the release tarball to an archive directory
#---------------------------------------------------------------------

use 5.008;
our $VERSION = '0.02';
# This file is part of Dist-Zilla-PluginBundle-CJM 0.02 (March 7, 2010)


use Moose;
use Moose::Autobox;
with 'Dist::Zilla::Role::Releaser';

use autodie ':io';
use Path::Class qw(file);
#---------------------------------------------------------------------


has directory => (
  is       => 'ro',
  isa      => 'Str',
  default  => 'releases',
);

#---------------------------------------------------------------------
# Main entry point:

sub release
{
  my ($self, $tgz) = @_;

  chmod(0444, $tgz);

  my $dest = file($self->directory, $tgz->basename);

  rename $tgz, $dest;

  $self->log("Moved archive to $dest");
} # end release

#---------------------------------------------------------------------
no Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__

=head1 NAME

Dist::Zilla::Plugin::ArchiveRelease - Move the release tarball to an archive directory

=head1 VERSION

This document describes version 0.02 of
Dist::Zilla::Plugin::ArchiveRelease, released March 7, 2010
as part of Dist-Zilla-PluginBundle-CJM version 0.02.

=head1 DESCRIPTION

If included, this plugin will cause the F<release> command to mark the
tarball read-only and move it to an archive directory.  You can
combine this with another Releaser plugin (like
L<UploadToCPAN|Dist::Zilla::Plugin::UploadToCPAN>), but it must be the
last Releaser in your config (or the other Releasers won't be able to
find the file being released).

=head1 ATTRIBUTES

=head2 directory

The directory to which the tarball will be moved.
Defaults to F<releases>.


=for Pod::Coverage
release

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

=head1 AUTHOR

Christopher J. Madsen  C<< <perl AT cjmweb.net> >>

Please report any bugs or feature requests to
C<< <bug-Dist-Zilla-PluginBundle-CJM AT rt.cpan.org> >>,
or through the web interface at
L<http://rt.cpan.org/Public/Bug/Report.html?Queue=Dist-Zilla-PluginBundle-CJM>

You can follow or contribute to Dist-Zilla-PluginBundle-CJM's development at
L<< http://github.com/madsen/dist-zilla-pluginbundle-cjm >>.

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Christopher J. Madsen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENSE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut
