namespace :heroku do
  desc "Run migrations and seed db"
  task :release do
    seedForE2E = ENV['E2E'] || false
    if seedForE2E
      puts "I'll reset, migrate and seed the database for testing purposes"
      './bin/rails db:migrate:reset'
      './bin/rails db:seed'
    end
  end
end