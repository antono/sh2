namespace :sh2 do

  PLUGIN_ROOT = File.dirname(__FILE__) + '/..'

  STYLESHEETS = Dir[PLUGIN_ROOT + '/assets/stylesheets/*'].select { |e| File.file?(e) }
  JAVASCRIPTS = Dir[PLUGIN_ROOT + '/assets/javascripts/*'].select { |e| File.file?(e) }

  desc "Copies syntax highlighter assets (css+js) to public dir"
  task :install do
    %w{javascripts stylesheets}.each do |atype|
      dest = File.join(RAILS_ROOT, 'public', atype, 'sh2')
      FileUtils.mkdir(dest)
      FileUtils.cp atype.upcase.constantize, dest, :verbose => true
    end
    puts "\n==> Syntax Highlighter assets installed!"
  end

  desc "Updates syntax highlighter assets (css+js) in public dir"
  task :update do
    Rake::Task['sh2:uninstall'].invoke
    Rake::Task['sh2:install'].invoke
    puts "\n==> Syntax Highlighter assets updated!"
  end

  desc "Deletes syntax highlighter assets (css+js) from public dir"
  task :uninstall do
    %w{javascripts stylesheets}.each do |atype|
      FileUtils.rm_rf(File.join(RAILS_ROOT, 'public', atype, 'sh2'))
    end
    puts "\n==> Syntax Highlighter assets uninstalled!"
  end

end
