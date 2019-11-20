lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jruby/async/profiler/version"

Gem::Specification.new do |spec|
  spec.name          = "jruby-async-profiler"
  spec.version       = Jruby::Async::Profiler::VERSION
  spec.authors       = ["Charles Oliver Nutter"]
  spec.email         = ["headius@headius.com"]

  spec.summary       = "Installer for the JVM async-profiler to use with JRuby"
  spec.description   = "This gem contains the sources and build scripts to build the async-profiler JVM plugin. This can be used with JRuby to profile CPU, memory, and lock contention."
  spec.homepage      = "https://github.com/jruby/jruby-async-profiler"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jruby/jruby-async-profiler"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z --recurse-submodules`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.extensions = ['ext/Rakefile']

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
