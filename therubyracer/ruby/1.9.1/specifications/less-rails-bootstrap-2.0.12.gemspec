# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "less-rails-bootstrap"
  s.version = "2.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ken Collins"]
  s.date = "2012-04-25"
  s.description = "CSS toolkit from Twitter For Rails 3.1 Asset Pipeline. Best one of all!"
  s.email = ["ken@metaskills.net"]
  s.homepage = "http://github.com/metaskills/less-rails-bootstrap"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "CSS toolkit from Twitter For Rails 3.1 Asset Pipeline"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<less-rails>, ["~> 2.2.0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<guard-minitest>, [">= 0"])
      s.add_development_dependency(%q<rails>, ["~> 3.1"])
    else
      s.add_dependency(%q<less-rails>, ["~> 2.2.0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<guard-minitest>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<less-rails>, ["~> 2.2.0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<guard-minitest>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.1"])
  end
end
