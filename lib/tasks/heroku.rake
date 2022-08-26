namespace :heroku do
  desc "Run migrations and seed db"
  task :release do
    puts "My rake task run in the release phase: #{ENV['RAK_ENV']}"
  end
end