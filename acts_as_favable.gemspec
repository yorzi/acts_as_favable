# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'acts_as_favable'
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andy Wang"]
  s.date = Time.now.strftime('%Y-%m-%d')
  s.description = 'Plugin/Gem that provides favorites functionality'
  s.email = 'wangyaodi@gmail.com'
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
  s.homepage = 'https://github.com/yorzi/acts_as_favable'
  s.require_paths = ["lib"]
  s.summary = 'Plugin/gem that provides favorite functionality'
  s.required_ruby_version = '>= 2.6.0'
  
  s.add_dependency 'activerecord', '>= 6.0', '< 9.0'
  s.add_dependency 'activesupport', '>= 6.0', '< 9.0'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rails', '>= 6.0', '< 9.0'
end
