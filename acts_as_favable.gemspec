require_relative "lib/acts_as_favable/version"

Gem::Specification.new do |spec|
  spec.name = "acts_as_favable"
  spec.version = ActsAsFavable::VERSION
  spec.authors = ["Andy Wang"]
  spec.email = ["wangyaodi@gmail.com"]

  spec.summary = "Add polymorphic favorites to Active Record models"
  spec.description = "A small Active Record extension that adds polymorphic favorite associations, finders, and a Rails generator."
  spec.homepage = "https://github.com/yorzi/acts_as_favable"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.metadata = {
    "source_code_uri" => spec.homepage,
    "bug_tracker_uri" => "#{spec.homepage}/issues",
    "changelog_uri" => "#{spec.homepage}/blob/master/CHANGELOG.md"
  }

  spec.files = Dir.chdir(__dir__) do
    Dir["lib/**/*", "README.markdown", "CHANGELOG.md", "MIT-LICENSE"].reject { |path| File.directory?(path) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 7.2", "< 8.2"
  spec.add_dependency "activesupport", ">= 7.2", "< 8.2"

  spec.add_development_dependency "rake", "~> 13.0"
end
