
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Dist-Zilla-PluginBundle-CJM',
  NAME      => 'Dist::Zilla::PluginBundle::CJM',
  AUTHOR    => "Christopher\ J\.\ Madsen\ \<perl\@cjmweb\.net\>",
  ABSTRACT  => "CJM\'s\ plugins\ for\ Dist\:\:Zilla",
  VERSION   => '0.01',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Moose::Autobox" => '0.09',
    "Module::Build::ModuleInfo" => '0.28',
    "Hash::Merge::Simple" => '0',
    "autodie" => '0',
    "Dist::Zilla" => '1.092680',
    "File::Temp" => '0',
    "Pod::Loom" => '0',
    "Path::Class" => '0',
    "Moose" => '0.65',
  },
  test => {TESTS => ''}
);

