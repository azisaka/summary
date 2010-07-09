# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{summary}
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bruno Azisaka Maciel"]
  s.cert_chain = ["/Users/Bruno/.certs/gem-public_cert.pem"]
  s.date = %q{2010-07-09}
  s.description = %q{This is a simple gem that generates introduction text from a long text, it will always break the text at the end of the last word near to the limit you informed as argument.}
  s.email = %q{bruno [at] bubble [dot] com [dot] br}
  s.extra_rdoc_files = ["CHANGELOG", "README.rdoc", "lib/summary.rb"]
  s.files = ["CHANGELOG", "Manifest", "README.rdoc", "Rakefile", "lib/summary.rb", "rails/init.rb", "spec/spec_helper.rb", "spec/summary_spec.rb", "summary.gemspec"]
  s.homepage = %q{http://github.com/azisaka/summary}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Summary", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{summary}
  s.rubygems_version = %q{1.3.7}
  s.signing_key = %q{/Users/Bruno/.certs/gem-private_key.pem}
  s.summary = %q{This is a simple gem that generates introduction text from a long text, it will always break the text at the end of the last word near to the limit you informed as argument.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
