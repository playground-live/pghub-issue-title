# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pghub/issue_title/version"

Gem::Specification.new do |spec|
  spec.name          = "pghub-issue_title"
  spec.version       = Pghub::IssueTitle::VERSION
  spec.authors       = ["Ebinuma Kenichi"]
  spec.email         = ["ktennis.mqekr12@gmail.com"]

  spec.summary       = %q{Post issue title to your github}
  spec.description   = %q{This gem posts issue title when you write "ref issue's URL" to your github conversation}
  spec.homepage      = "https://github.com/ebkn12"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  # TODO : baseを公開したらコメントイン
  # sped.add_dependency "pghub-base"
end
