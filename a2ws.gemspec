# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{a2ws}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andy Shen", "Josh Owens"]
  s.date = %q{2009-05-31}
  s.email = %q{andy@shenie.info}
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
     "VERSION.yml",
     "a2ws.gemspec",
     "lib/a2ws.rb",
     "lib/a2ws/base.rb",
     "lib/a2ws/image.rb",
     "lib/a2ws/image_search.rb",
     "lib/a2ws/item.rb",
     "lib/a2ws/item_search.rb",
     "spec/a2ws_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/handcrafted/a2ws}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Wrapper for Amazon Associates Web Service (A2WS).}
  s.test_files = [
    "spec/a2ws_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.2.2"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.3"])
      s.add_dependency(%q<activesupport>, [">= 2.2.2"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.3"])
    s.add_dependency(%q<activesupport>, [">= 2.2.2"])
  end
end
