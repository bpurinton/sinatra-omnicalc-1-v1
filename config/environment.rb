require 'sinatra'

app_directory = File.join(__dir__, '..', 'app')

ruby_files = File.join(app_directory, '**', '*.rb')

ruby_files_paths = Dir.glob(ruby_files)

ruby_files_paths.each do |file|
   require file
end
