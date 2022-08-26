namespace :heroku do
  desc "Run migrations and seed db"
  task :release => :environment do
    seedForE2E = ENV['E2E'] || false
    if seedForE2E
      puts "I'll reset, migrate and seed the database for testing purposes"
      # DatabaseCleaner.strategy = :truncation
      # DatabaseCleaner.clean
      # puts "Migrating..."
      # Rake::Task["db:migrate"].invoke
      # puts "Seeding the DB..."
      # Rake::Task["db:seed"].invoke
      'heroku run rake db:migrate -a todo-kr-stg'
      'heroku run rake db:seed -a todo-kr-stg'
    end
  end
end