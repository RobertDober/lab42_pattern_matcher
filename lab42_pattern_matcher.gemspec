$:.unshift( File.expand_path( "../lib", __FILE__ ) )
require 'lab42/pattern_matcher/version'
version = Lab42::PatternMatcher::Version
Gem::Specification.new do |s|
  s.name        = 'lab42_pattern_matcher'
  s.version     = version
  s.summary     = "Pattern Matching à la Elixir (w/o the syntax)"
  s.description = %{Object Oriented Pattern Matching implementation using the === operator.
Tailor made for usage in case}
  s.authors     = ["Robert Dober"]
  s.email       = 'robert.dober@gmail.com'
  s.files       = Dir.glob("lib/**/*.rb")
  s.files      += %w{LICENSE README.md}
  s.homepage    = "https://github.com/RobertDober/lab42_pattern_matcher"
  s.licenses    = ["Apache 2", "MIT"]

  s.required_ruby_version = '>= 2.4.0'


  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-byebug', '~> 0.2'
  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'qed', '~> 2.9'
  s.add_development_dependency 'ae', '~> 1.8'
end
