namespace :heroku do
  desc "Run migrations and seed db"
  task :release, [:environment] do |t, args|
    puts "My rake task run in the release phase: #{args[:environment]}"
    puts "ENV[RACK_ENV] = #{ENV['RACK_ENV']}"
  end
end