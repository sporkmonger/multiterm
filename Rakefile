lib_dir = File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
$:.unshift(lib_dir)
$:.uniq!

require 'rubygems'
require 'rake'

require File.join(File.dirname(__FILE__), 'lib/multiterm', 'version')

PKG_DISPLAY_NAME   = 'MultiTerm'
PKG_NAME           = PKG_DISPLAY_NAME.downcase
PKG_VERSION        = MultiTerm::VERSION::STRING
PKG_FILE_NAME      = "#{PKG_NAME}-#{PKG_VERSION}"

RELEASE_NAME       = "REL #{PKG_VERSION}"
GIT_HUB_URL        = "https://github.com/sporkmonger/multiterm"

PKG_AUTHOR         = 'Bob Aman'
PKG_AUTHOR_EMAIL   = 'bob@sporkmonger.com'
PKG_HOMEPAGE       = GIT_HUB_URL
PKG_SUMMARY        = 'Package Summary'
PKG_DESCRIPTION    = <<-TEXT
MultiTerm is a rudimentary terminal multiplexer for OS X that uses the built-in Terminal.app tabs.
TEXT

PKG_FILES = FileList[
    'lib/**/*', 'spec/**/*', 'vendor/**/*',
    'tasks/**/*', 'website/**/*',
    '[A-Z]*', 'Rakefile'
].exclude(/database\.yml/).exclude(/[_\.]git$/).exclude(/Gemfile\.lock/)

RCOV_ENABLED = (RUBY_PLATFORM != 'java' && RUBY_VERSION =~ /^1\.8/)
if RCOV_ENABLED
  task :default => 'spec:verify'
else
  task :default => 'spec'
end

WINDOWS = (RUBY_PLATFORM =~ /mswin|win32|mingw|bccwin|cygwin/) rescue false
SUDO = WINDOWS ? '' : ('sudo' unless ENV['SUDOLESS'])

Dir['tasks/**/*.rake'].each { |rake| load rake }
