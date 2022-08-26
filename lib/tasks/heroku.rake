namespace :heroku do
  desc "Run migrations and seed db"
  task :release => :environment do
    seedForE2E = ENV['E2E'] || false
    if seedForE2E
      # Rake::Task["heroku:migrate"].execute
      # Rake::Task["heroku:seed"].execute
      puts 'Run migration with Heroku'
      sh 'heroku run rake db:migrate -a todo-kr-stg'
      puts 'Seed database'
      sh 'heroku run rake db:seed -a todo-kr-stg'
    end
  end

  task :migrate do
    puts 'Run migration with Heroku'
    'heroku run rake db:migrate -a todo-kr-stg'
  end

  task :seed => :environment do
    puts 'Seed database'
    'heroku run rake db:seed -a todo-kr-stg'
  end
end