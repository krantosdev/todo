namespace :heroku do
  desc "Run migrations and seed db"
  task :release do
    seedForE2E = ENV['E2E'] || false
    if seedForE2E
      puts "I'll migrate and seed the database for testing purposes"
      sh "heroku run rake db:migrate"
      sh "heroku run rake db:seed"
    end
  end
end