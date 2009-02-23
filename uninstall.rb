require 'ftools'
 
puts "Removing wufoo_style.css from #{RAILS_ROOT}/public/stylesheets/"
 
FileUtils.safe_unlink(File.join(RAILS_ROOT, 'public', 'stylesheets', 'wufoo_style.css'))
FileUtils.safe_unlink(File.join(RAILS_ROOT, 'public', 'javascripts', 'wufoo_style.js'))