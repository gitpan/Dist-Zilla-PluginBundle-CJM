
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::PluginBundle::CJM',
                       'DISTNAME' => 'Dist-Zilla-PluginBundle-CJM',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Christopher J. Madsen <perl@cjmweb.net>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'Build a distribution like CJM',
                       'EXE_FILES' => [],
                       'VERSION' => '0.08',
                       'PREREQ_PM' => {
                                        'Dist::Zilla::Plugin::MetaYAML' => '0',
                                        'Dist::Zilla::Role::PluginBundle::Easy' => '0',
                                        'Dist::Zilla::Plugin::MatchManifest' => '0.03',
                                        'Dist::Zilla::Plugin::MetaConfig' => '0',
                                        'Dist::Zilla::Plugin::GatherDir' => '0',
                                        'Dist::Zilla::Plugin::License' => '0',
                                        'Dist::Zilla::Plugin::GitVersionCheckCJM' => '0.08',
                                        'Dist::Zilla::Plugin::PodLoom' => '0.08',
                                        'Moose' => '0.65',
                                        'Dist::Zilla::Plugin::TestRelease' => '0',
                                        'Dist::Zilla::Plugin::PodCoverageTests' => '0',
                                        'Dist::Zilla::Plugin::ManifestSkip' => '0',
                                        'Git' => '0',
                                        'Dist::Zilla::Plugin::ExtraTests' => '0',
                                        'Dist::Zilla::Plugin::Repository' => '0',
                                        'Dist::Zilla::Plugin::TemplateCJM' => '0.08',
                                        'Moose::Autobox' => '0.09',
                                        'Dist::Zilla::Plugin::UploadToCPAN' => '0',
                                        'Dist::Zilla::Plugin::PodSyntaxTests' => '0',
                                        'Dist::Zilla' => '2',
                                        'Dist::Zilla::Plugin::MakeMaker' => '0',
                                        'Dist::Zilla::Plugin::VersionFromModule' => '0.08',
                                        'Dist::Zilla::Plugin::ArchiveRelease' => '0.08',
                                        'Dist::Zilla::Plugin::PruneCruft' => '0',
                                        'Dist::Zilla::PluginBundle::Git' => '1.100900'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



