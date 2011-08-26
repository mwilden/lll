# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lll}
  s.version = "1.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Mark Wilden}]
  s.date = %q{2011-08-26}
  s.description = %q{= lll

lll() is used in debugging to display an expression and its value.

=== Motivation

One of the most basic tools in debugging is printing out the values of
variables (or other expressions) during program execution:

    puts user_name

Sometimes you need to label these values so you know what they're
referring to, especially if you're outputting a lot of them:

    puts "user_name = #{message}"

lll() does the labelling automatically: 

    lll{'user_name'}

The expression is passed as a string inside a block. It's useful to
create a text editor macro that outputs <tt>lll{''}</tt> and leaves the
cursor inside the apostrophes.

=== Other benefits

Output goes to standard output and the Rails log (if available).

Output is displayed in reverse video, so it's easy to pick out from the
log or console.

lll() uses #inspect to output the expression. It outputs Enumerable
members (except strings) on separate lines.

Output is tagged with the file and line number where it appears, so
you can easily find lll's that you forgot to take out. The time of
day (but not the date) is also printed, so you don't waste time
looking at old output.

=== Outputting additional text

Sometimes you want to include some other string, along with the label
and value like this:

    puts "After polling the queue, user_name = #{user_name}"

You can pass a string to lll() to print a string:

    lll("After polling the queue"){'user_name'}

And because lll() outputs in reverse video, and to the Rails log, it can
be useful to simply print a string without an expression:

    lll "After read_user"

=== Copyright

Copyright (c) 2011 Mark Wilden. See LICENSE for details.
}
  s.email = %q{mark@mwilden.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "doc/README_rdoc.html",
    "lib/lll.rb",
    "lll.gemspec",
    "test/test.rb"
  ]
  s.homepage = %q{http://github.com/mwilden/lll}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Output labeled data when debugging}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

