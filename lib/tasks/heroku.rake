namespace :heroku do
  desc "Run migrations and seed db"
  task :release => :environment do
    seedForE2E = ENV['E2E'] || false
    if seedForE2E
      Rake::Task["heroku:migrate"].invoke
      Rake::Task["heroku:seed"].invoke
      # DatabaseCleaner.strategy = :truncation
      # DatabaseCleaner.clean
      # puts "Migrating..."
      # Rake::Task["db:migrate"].invoke
      # puts "Seeding the DB..."
      # Rake::Task["db:seed"].invoke
      # 'heroku run rake db:migrate'
      # 'heroku run rake db:seed'
    end
  end

  task :migrate do
    puts 'Run migration with Heroku'
    'heroku run rake db:migrate'
  end

  task :seed do
    puts 'Seed database'
    'heroku run rake db:seed'
  end
  # task :truncate_db => :environment do
  #   puts "DatabaseCleaner clean..."
  #   DatabaseCleaner.strategy = :truncation
  #   DatabaseCleaner.clean
  # end
end