
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::PluginBundle::CJM',
                       'DISTNAME' => 'Dist-Zilla-PluginBundle-CJM',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Christopher J. Madsen <perl@cjmweb.net>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'CJM\'s plugins for Dist::Zilla',
                       'EXE_FILES' => [],
                       'VERSION' => '0.03',
                       'PREREQ_PM' => {
                                        'Scalar::Util' => '0',
                                        'Moose::Autobox' => '0.09',
                                        'List::Util' => '0',
                                        'Module::Build::ModuleInfo' => '0.28',
                                        'Hash::Merge::Simple' => '0',
                                        'File::Temp' => '0',
                                        'Dist::Zilla' => '1.100660',
                                        'autodie' => '0',
                                        'Path::Class' => '0',
                                        'Pod::Loom' => '0',
                                        'Moose' => '0.65'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



