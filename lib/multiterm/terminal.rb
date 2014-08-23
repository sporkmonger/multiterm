require 'osaka'

module Osaka
  class Terminal < TypicalApplication
    def initialize
      super "Terminal"
    end

    def tab_configure(options={})
      tab_name = options[:name]
      script = options[:script]
      directory = options[:directory]
      control.keystroke('t', :command) if options[:new_tab]
      if directory != nil
        control.tell('do script "cd \'' + directory + '\'" in front window')
      end
      if tab_name != nil
        tab_name.gsub!(/[^a-zA-Z0-9 \_\-\.]/, '')

        # This low-level block is needed because Osaka naively splits
        # on ';' character, which we need to use mid-script.
        script_commands = [
          'tell application "Terminal"',
          'do script "printf \'\\\\\e]1;' + tab_name.to_s + '\\\\\a\'" in front window',
          'end tell'
        ].map { |c| c.gsub("\"", "\\\"") }
        escaped_commands = ""
        script_commands.each { |l| escaped_commands += " -e \"#{l.strip}\"" }
        new_tab_output = `osascript#{escaped_commands} 2>&1`
      end
      control.tell('do script "clear" in front window')
      if script != nil
        # LOL, yes, we need to triple-escape for double quotes.
        # Single quotes should Just Work.
        control.tell('do script "' + script.gsub("\"", "\\\\\\\"") + '" in front window')
      end
      return nil
    end
  end
end
