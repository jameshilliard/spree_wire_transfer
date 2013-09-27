# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_wire_transfer'
  s.version     = '0.1.0'
  s.summary     = 'Adds payment method by wire transfer'
  s.required_ruby_version = '>= 1.9.3'

  s.authors    = ['Yudi Rahono']
  s.email     = 'palanglung@gmail.com'
  s.homepage  = 'https://github.com/palanglung/spree_wire_transfer'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '~> 2.0'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_frontend', spree_version
  s.add_dependency 'spree_backend', spree_version

  s.add_development_dependency 'rspec-rails', '~> 2.13'
  s.add_development_dependency 'shoulda-matchers', '~> 2.4.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.2.1'
  s.add_development_dependency 'email_spec', '~> 1.4.0'
  s.add_development_dependency 'capybara', '~> 2.1.0'
  s.add_development_dependency 'database_cleaner', '~> 1.0.1'
  s.add_development_dependency 'selenium-webdriver', '~> 2.35.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'debugger'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sqlite3'
end
