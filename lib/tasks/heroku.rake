namespace :heroku do
  desc "Run migrations and seed db"
  task :release do
    isE2E = ENV['E2E'] || false
    if isE2E
      puts 'Run migration with Heroku'
        Rake::Task["db:migrate"].invoke
      puts 'Seed database'
        Rake::Task["db:seed"].invoke
    end
  end
end