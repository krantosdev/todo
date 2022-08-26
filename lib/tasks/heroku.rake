namespace :heroku do
  desc "Run migrations and seed db"
  task :release do
    seedForE2E = ENV['E2E'] || false
    if seedForE2E
      puts "I'll reset, migrate and seed the database for testing purposes"
      'heroku pg:reset -a todo-kr-stg'
      'heroku run rake db:migrate -a todo-kr-stg'
      'heroku run rake db:seed -a todo-kr-stg'
    end
  end
end