#---------------------------------------------------------------------
package Dist::Zilla::PluginBundle::CJM;
#
# Copyright 2009 Christopher J. Madsen
#
# Author: Christopher J. Madsen <perl@cjmweb.net>
# Created:  4 Oct 2009
#
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See either the
# GNU General Public License or the Artistic License for more details.
#
# ABSTRACT: Build a distribution like CJM
#---------------------------------------------------------------------

our $VERSION = '0.08';
# This file is part of Dist-Zilla-PluginBundle-CJM 0.08 (April 14, 2010)

use Moose;
use Moose::Autobox;
with 'Dist::Zilla::Role::PluginBundle::Easy';


sub configure
{
  my $self = shift;

  my $arg = $self->payload;

  $self->add_plugins('VersionFromModule')
      unless $arg->{manual_version};

  $self->add_plugins(
    qw(
      GatherDir
      PruneCruft
      ManifestSkip
      MetaYAML
      License
      PodSyntaxTests
      PodCoverageTests
      ExtraTests
    ),
    [PodLoom => {
      data => 'tools/loom.pl',
      $self->config_slice({
        pod_template => 'template',
      })->flatten,
    } ],
    # either MakeMaker or ModuleBuild:
    [ ($arg->{builder} || 'MakeMaker') =>
      scalar $self->config_slice(qw( eumm_version mb_version ))
    ],
    qw(
      MetaConfig
      MatchManifest
      GitVersionCheckCJM
      TemplateCJM
    ),
    [ Repository => { git_remote => 'github' } ],
  );

  $self->add_bundle(Git => {
    allow_dirty => 'Changes',
    commit_msg  => 'Updated Changes for %{MMMM d, yyyy}d release of %v',
    tag_format  => '%v',
    tag_message => 'Tagged %N %v',
    push_to     => 'github',
  });

  $self->add_plugins(
    'TestRelease',
    'UploadToCPAN',
    [ ArchiveRelease => { directory => 'cjm_releases' } ],
  );
} # end configure

no Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__

=head1 NAME

Dist::Zilla::PluginBundle::CJM - Build a distribution like CJM

=head1 VERSION

This document describes version 0.08 of
Dist::Zilla::PluginBundle::CJM, released April 14, 2010
as part of Dist-Zilla-PluginBundle-CJM version 0.08.

=head1 DESCRIPTION

This is the plugin bundle that CJM uses. It is equivalent to:

  [VersionFromModule]

  [GatherDir]
  [PruneCruft]
  [ManifestSkip]
  [MetaYAML]
  [License]
  [PodSyntaxTests]
  [PodCoverageTests]
  [ExtraTests]
  [PodLoom]
  data = tools/loom.pl
  [MakeMaker]
  [MetaConfig]
  [MatchManifest]
  [GitVersionCheckCJM]
  [TemplateCJM]

  [Repository]
  git_remote = github

  [@Git]
  allow_dirty = Changes
  commit_msg  = Updated Changes for %{MMMM d, yyyy}d release of %v
  tag_format  = %v
  tag_message = Tagged %N %v
  push_to     = github

  [TestRelease]
  [UploadToCPAN]
  [ArchiveRelease]
  directory = cjm_releases

If the C<manual_version> argument is given to the bundle,
VersionFromModule is omitted.  If the C<builder> argument is given, it
is used instead of MakeMaker.  If the C<pod_template> argument is
given, it is passed to PodLoom as its C<template>.

=for Pod::Coverage
configure

=head1 CONFIGURATION AND ENVIRONMENT

Dist::Zilla::PluginBundle::CJM requires no configuration files or environment variables.

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

=head1 AUTHOR

Christopher J. Madsen  S<C<< <perl AT cjmweb.net> >>>

Please report any bugs or feature requests to
S<C<< <bug-Dist-Zilla-PluginBundle-CJM AT rt.cpan.org> >>>,
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
