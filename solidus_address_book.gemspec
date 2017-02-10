Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_address_book'
  s.version     = '2.1.alpha'
  s.summary     = 'Adds address book for users to Solidus'
  s.required_ruby_version = '>= 2.1.2'

  s.author            = 'Roman Smirnov - Manuel Vidaurre'
  s.email             = 'POMAHC@gmail.com - manuel.vidaurre@magmalabs.io'
  s.homepage          = 'https://github.com/magma-labs/solidus_address_book'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus_core', '>= 1.0.6', '< 3'
  s.add_development_dependency 'solidus_auth_devise', '>= 1.0', '< 2.0'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'ffaker', '~> 2.2.0'
  s.add_development_dependency 'poltergeist', '~> 1.5'
  s.add_development_dependency 'capybara-screenshot', '~> 1.0.11'
end
