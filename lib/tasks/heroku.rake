namespace :heroku do
  desc "Run migrations and seed db"
  task :release do
    seedForE2E = ENV['E2E'] || false
    if seedForE2E
      puts "I'll migrate and seed the database for testing purposes"
      'heroku run rake db:migrate'
      'heroku run rake db:seed'
    end
  end
end