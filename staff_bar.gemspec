$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "staff_bar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "staff_bar"
  spec.version     = StaffBar::VERSION
  spec.authors     = ["Rolandas Barysas"]
  spec.email       = ["rolandas@rolandasb.com"]
  spec.homepage    = "https://github.com/decentbudget/staff_bar"
  spec.summary     = "Show a bar with general project information for administrators."
  spec.description = "Show a bar with general project information for administrators."
  spec.license     = "MIT"

  spec.files = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 5.0.0"
  spec.add_dependency "octicons_helper", "~> 9"

  spec.add_development_dependency "sqlite3"
end
