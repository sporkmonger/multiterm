# Copyright 2014 Bob Aman
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'multiterm/version'
require 'multiterm/terminal'

module MultiTerm
  ##
  # Memoized copy of the default configuration.
  def self.configuration
    @@configuration ||= read_configuration
  end

  ##
  # Loads the configuration file for the current path.
  def self.read_configuration(path=nil)
    if path != nil && File.exists?(path) && File.directory?(path)
      current_path = path
    elsif path != nil && File.exists?(path) && !File.directory?(path)
      current_path = File.dirname(path)
    else
      current_path = File.expand_path('.')
    end
    home_path = File.expand_path('~')
    search_path = current_path
    while search_path != '/' && search_path != home_path
      if File.exists?(File.join(search_path, '.multiterm.yml'))
        settings = YAML.load(File.read(File.join(search_path, '.multiterm.yml')))
        settings[:root] = File.expand_path(search_path)
        return settings if settings
      end
      search_path = File.expand_path(File.join(search_path, '..'))
    end
    return nil
  end

  def self.execute
    if configuration
      app = Osaka::Terminal.new
      app.activate
      for tab_config in configuration[:tabs]
        app.new_tab({:directory => configuration[:root]}.merge(tab_config))
      end
    else
      puts "Missing '.multiterm.yml' configuration."
    end
  end
end
