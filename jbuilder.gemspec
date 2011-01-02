# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jbuilder}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Uros Jurglic"]
  s.date = %q{2011-01-02}
  s.description = %q{A gem that offers builder like templating for JSON}
  s.email = %q{jurglic @nospam@ antiveb.com}
  s.files = ["jbuilder.gemspec", "Rakefile"]
  s.homepage = %q{http://github.com/antiveb/jbuilder}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Jbuilder", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{jbuilder}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A gem that offers builder like templating for JSON}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
