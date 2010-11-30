# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_favable}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andy Wang"]
  s.autorequire = %q{acts_as_favable}
  s.date = %q{2010-11-29}
  s.description = %q{Plugin/Gem that provides favorites functionality}
  s.email = %q{wangyaodi@gmail.com}
  s.extra_rdoc_files = ["README.markdown", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", 
             "README.markdown", 
             "lib/acts_as_favable.rb", 
             "lib/favorite_methods.rb", 
             "lib/favable_methods.rb", 
             "lib/generators", 
             "lib/generators/favorite", 
             "lib/generators/favorite/favorite_generator.rb", 
             "lib/generators/favorite/templates", 
             "lib/generators/favorite/templates/favorite.rb", 
             "lib/generators/favorite/templates/create_favorites.rb", 
             "init.rb", 
             "install.rb"]
  s.has_rdoc = false
  s.homepage = %q{https://github.com/yorzi/acts_as_favable}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Plugin/gem that provides favorite functionality}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
