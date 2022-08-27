namespace :heroku do
  desc "Run migrations and seed db"
  task :release do
    is_e2e = ENV['E2E'] || false
    if is_e2e && $RACK_ENV != 'production'
      puts 'Truncate database'
        Rake::Task["heroku:clean_db"].invoke
      puts 'Run migration with Heroku'
        Rake::Task["db:migrate"].invoke
      puts 'Seed database'
        Rake::Task["db:seed"].invoke
    end
  end

  task :clean_db => :environment do
    # This block will automatically empty the database every time db:seed is run.
    ActiveRecord::Base.connection.tables.each do |table|
      # Don't clear our migration history! Clear everything else.
      if table != 'schema_migrations'
        # http://stackoverflow.com/a/7758797
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} CASCADE;")
        # http://stackoverflow.com/questions/2097052/rails-way-to-reset-seed-on-id-field
        ActiveRecord::Base.connection.reset_pk_sequence! table
      end
    end
  end
end