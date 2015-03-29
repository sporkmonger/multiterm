# -*- encoding: utf-8 -*-
# stub: multiterm 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "multiterm"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bob Aman"]
  s.date = "2015-03-29"
  s.description = "MultiTerm is a rudimentary terminal multiplexer for OS X that uses the built-in Terminal.app tabs.\n"
  s.email = "bob@sporkmonger.com"
  s.executables = ["multiterm"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["CHANGELOG", "Gemfile", "LICENSE", "README.md", "Rakefile", "bin", "bin/multiterm", "lib", "lib/multiterm", "lib/multiterm.rb", "lib/multiterm/terminal.rb", "lib/multiterm/version.rb", "multiterm.gemspec", "pkg", "spec", "spec/spec.opts", "spec/spec_helper.rb", "tasks", "tasks/clobber.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/metrics.rake", "tasks/spec.rake", "tasks/yard.rake", "website", "website/index.html"]
  s.homepage = "https://github.com/sporkmonger/multiterm"
  s.licenses = ["Apache License 2.0"]
  s.rdoc_options = ["--main", "README.md"]
  s.rubygems_version = "2.4.6"
  s.summary = "Package Summary"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<osaka>, [">= 0.4.8", "~> 0.4"])
      s.add_development_dependency(%q<rake>, [">= 0.7.3"])
      s.add_development_dependency(%q<rspec>, [">= 2.9.0"])
      s.add_development_dependency(%q<launchy>, [">= 0.3.2"])
    else
      s.add_dependency(%q<osaka>, [">= 0.4.8", "~> 0.4"])
      s.add_dependency(%q<rake>, [">= 0.7.3"])
      s.add_dependency(%q<rspec>, [">= 2.9.0"])
      s.add_dependency(%q<launchy>, [">= 0.3.2"])
    end
  else
    s.add_dependency(%q<osaka>, [">= 0.4.8", "~> 0.4"])
    s.add_dependency(%q<rake>, [">= 0.7.3"])
    s.add_dependency(%q<rspec>, [">= 2.9.0"])
    s.add_dependency(%q<launchy>, [">= 0.3.2"])
  end
end
