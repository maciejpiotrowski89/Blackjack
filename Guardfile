# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
require 'colored'
require 'open3'

clearing :on

guard :shell do
  watch(/(.*).swift$/) {|m|

    puts "Modified: #{m[0]}"
    puts "Running tests..."

    output = ""
    errors = ""
    exit_status = Open3.popen3("swift test") do |stdin, stdout, stderr, wait_thr|
      stdin.close
      output << stdout.read
      errors << stderr.read
      wait_thr.value
    end

    puts output.yellow

    if exit_status.success?
      puts errors.cyan
      puts "Passed".green
    else
      puts errors.red
      puts "Failed".red
    end
  }
end
