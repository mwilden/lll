# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lll/version"

Gem::Specification.new do |s|
  s.name        = "lll"
  s.version     = Lll::VERSION
  s.authors     = ["Mark Wilden"]
  s.email       = ["mark@mwilden.com"]
  s.homepage    = %q{http://github.com/mwilden/lll}
  s.summary     = %q{TODO: Write a gem summary}
  s.summary     = %q{Output labeled data when debugging}
  s.description = %q{Use this to display variables and their values while debugging}

  s.rubyforge_project = "lll"

  s.files = [
    "CHANGELOG.md",
    "README.md",
    "lib/lll.rb",
    "lib/lll/version.rb",
    "lll.gemspec",
  ]

  s.add_development_dependency "rake"
  # s.add_runtime_dependency "rest-client"
end
