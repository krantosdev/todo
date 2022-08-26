# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# This block will automatically empty the database every time db:seed is run.
ActiveRecord::Base.connection.tables.each do |table|
  # Don't clear our migration history! Clear everything else.
  if table != 'schema_migrations'
    # http://stackoverflow.com/a/7758797
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table};")
    # http://stackoverflow.com/questions/2097052/rails-way-to-reset-seed-on-id-field
    ActiveRecord::Base.connection.reset_pk_sequence! table
  end
end

todo_list = TodoList.new
todo_list.title = 'Comprar en el super'
todo_list.description = 'Ir al supermercado y comprar las cosas de la lista'
todo_list.save

todo_item = TodoItem.new
todo_item.todo_list = todo_list
todo_item.content = 'Shampoo'

todo_item.save

