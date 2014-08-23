# MultiTerm

<dl>
  <dt>Homepage</dt><dd><a href="https://multiterm.github.io/">MultiTerm</a></dd>
  <dt>Author</dt><dd><a href="mailto:bob@sporkmonger.com">Bob Aman</a></dd>
  <dt>Copyright</dt><dd>Copyright © 2014 Bob Aman</dd>
  <dt>License</dt><dd>Apache 2.0</dd>
</dl>

# Description

MultiTerm is a rudimentary terminal multiplexer for OS X that uses the built-in Terminal.app tabs.

# Example Usage

    # .multiterm.yml
    ---
    :parent:
      :name: Main
    :tabs:
    - :name: Server
      :script: bundle exec rails s
    - :name: Sidekiq
      :script: bundle exec sidekiq -q default
    - :name: Chef
      :directory: ../chef-cookbooks
    - :name: SSH
      :script: echo "ssh ubuntu@1.2.3.4"

    # shell
    multiterm

# Install

* sudo gem install multiterm
