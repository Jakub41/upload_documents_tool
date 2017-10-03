
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "upload_documents_tool/version"

Gem::Specification.new do |spec|
  spec.name          = "upload_documents_tool"
  spec.version       = UploadDocumentsTool::VERSION
  spec.authors       = ["Jakub41"]
  spec.email         = ["lemiszewski@gmx.com"]

  spec.summary       = %q{A tool for upload various kind of documents}
  spec.description   = %q{This tool is an easy way to upload documents of different kind.
                       The package has partials which thanks to a helper, make easier to implement and set inside other application.
                        Is posible then to set the partials views where desired.}
  spec.homepage      = "https://github.com/Jakub41/upload_documents_tool"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("railties", "~> 4.2.6")
  spec.add_dependency("jquery-rails")
  spec.add_dependency("kaminari", "~> 1.0.1")
  spec.add_dependency("bootstrap-kaminari-views", "~> 0.0.5")
  spec.add_dependency("bootstrap-sass")
  spec.add_dependency("jasny-bootstrap-rails")
  spec.add_dependency("font-awesome-sass")
  spec.add_dependency("toastr-rails")
  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
