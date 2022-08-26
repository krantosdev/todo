namespace :heroku do
  desc "Run migrations and seed db"
  task :release, [:environment] do
    puts "My rake task run in the release phase: #{:environment}"
  end
end