# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tencent/weibo/version'

Gem::Specification.new do |gem|
  gem.name          = 'tencent-weibo'
  gem.version       = Tencent::Weibo::VERSION
  gem.authors       = ['Rainux Luo']
  gem.email         = ['rainux@gmail.com']
  gem.description   = %q{A simple Ruby interface to the Tencent Weibo API.}
  gem.summary       = %q{A simple Ruby interface to the Tencent Weibo API.}
  gem.homepage      = 'https://github.com/rainux/tencent-weibo'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'oauth2', '~> 0.9.1'
  gem.add_runtime_dependency 'multi_json', '~> 1.6'
end
