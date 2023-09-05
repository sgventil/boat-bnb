namespace :cache do
  desc 'Clear the entire cache'
  task :clear => :environment do
    Rails.cache.clear
  end
end
