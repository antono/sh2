namespace :sh2 do

  PLUGIN_ROOT = Rails.root + 'vendor/plugins/sh2'
  STYLESHEETS = Dir[PLUGIN_ROOT.to_s + '/assets/stylesheets/*'].select { |e| File.file?(e) }
  JAVASCRIPTS = Dir[PLUGIN_ROOT.to_s + '/assets/javascripts/*'].select { |e| File.file?(e) }

  
  desc "Copies syntax highlighter assets (css+js) to assets dirs"
  task :install do
    %w{javascripts stylesheets}.each do |atype|
      dest = File.join(Rails.root.to_s, '/app/assets/', atype, 'sh2/')
      FileUtils.mkdir(dest)
      FileUtils.cp atype.upcase.constantize, dest, :verbose => true
    end
    puts "\n==> Syntax Highlighter assets installed!"
  end

  desc "Updates syntax highlighter assets (css+js) in assets dir"
  task :update do
    Rake::Task['sh2:uninstall'].invoke
    Rake::Task['sh2:install'].invoke
    puts "\n==> Syntax Highlighter assets updated!"
  end

  desc "Deletes syntax highlighter assets (css+js) from assets dir"
  task :uninstall do
    %w{javascripts stylesheets}.each do |atype|
      FileUtils.rm_rf(File.join(Rails.root.to_s, '/app/assets', atype, 'sh2'))
    end
    puts "\n==> Syntax Highlighter assets uninstalled!"
  end

end
