$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'authority/version'

Gem::Specification.new do |s|
  s.name        = 'authority'
  s.version     = Authority::VERSION
  s.authors     = ['wkirschbaum']
  s.email       = ['wkirschbaum@gmail.com']
  s.homepage    = 'https://github/wkrischbaum/authority'
  s.summary     = 'Authorization for Rails applications'
  s.description = 'Authorization for Rails applications'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.2.1'

  s.add_development_dependency 'sqlite3'
end
