require 'ftools'
 
puts "Copying assets"
 
File.copy(
  File.join(File.dirname(__FILE__), 'assets', 'stylesheets', 'wufoo_form.css'),
  File.join(RAILS_ROOT, 'public', 'stylesheets')
)

File.copy(
  File.join(File.dirname(__FILE__), 'assets', 'javascripts', 'wufoo_form.js'),
  File.join(RAILS_ROOT, 'public', 'javascripts')
)
 
puts IO.read(File.join(File.dirname(__FILE__), 'README'))