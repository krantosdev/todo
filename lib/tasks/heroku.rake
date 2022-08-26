namespace :heroku do
  desc "Run migrations and seed db"
  task :release => :environment do
    seedForE2E = ENV['E2E'] || false
    if seedForE2E
      Rake::Task["heroku:migrate"].invoke
      Rake::Task["heroku:seed"].invoke
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
end