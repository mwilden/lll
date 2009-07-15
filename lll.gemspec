# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lll}
  s.version = "1.0.0"
  s.description = "Output labeled data when debugging"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Wilden"]
  s.date = %q{2009-07-15}
  s.email = %q{mark@mwilden.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/lll.rb"
  ]
  s.homepage = %q{http://github.com/mwilden/lll}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = "lll(message){'expression'}"
  s.rubyforge_project = "none"

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
