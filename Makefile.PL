
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Build a distribution like CJM',
  'AUTHOR' => 'Christopher J. Madsen <perl@cjmweb.net>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Dist-Zilla-PluginBundle-CJM',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Dist::Zilla::PluginBundle::CJM',
  'PREREQ_PM' => {
    'Dist::Zilla' => '4.200001',
    'Dist::Zilla::Plugin::ArchiveRelease' => '0.08',
    'Dist::Zilla::Plugin::ExtraTests' => '0',
    'Dist::Zilla::Plugin::GatherDir' => '0',
    'Dist::Zilla::Plugin::GitVersionCheckCJM' => '3.02',
    'Dist::Zilla::Plugin::License' => '0',
    'Dist::Zilla::Plugin::MakeMaker' => '0',
    'Dist::Zilla::Plugin::ManifestSkip' => '0',
    'Dist::Zilla::Plugin::MatchManifest' => '4.00',
    'Dist::Zilla::Plugin::MetaConfig' => '0',
    'Dist::Zilla::Plugin::MetaJSON' => '0',
    'Dist::Zilla::Plugin::MetaYAML' => '0',
    'Dist::Zilla::Plugin::PodCoverageTests' => '0',
    'Dist::Zilla::Plugin::PodLoom' => '4.00',
    'Dist::Zilla::Plugin::PodSyntaxTests' => '0',
    'Dist::Zilla::Plugin::PruneCruft' => '0',
    'Dist::Zilla::Plugin::Repository' => '0.16',
    'Dist::Zilla::Plugin::TemplateCJM' => '3.05',
    'Dist::Zilla::Plugin::TestRelease' => '0',
    'Dist::Zilla::Plugin::UploadToCPAN' => '0',
    'Dist::Zilla::Plugin::VersionFromModule' => '0.08',
    'Dist::Zilla::PluginBundle::Git' => '1.103520',
    'Dist::Zilla::Role::PluginBundle::Easy' => '0',
    'Git::Wrapper' => '0',
    'Moose' => '0.65',
    'Moose::Autobox' => '0.09'
  },
  'VERSION' => '4.02',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



