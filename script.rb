require 'mysql2'
require 'active_record'

mysql_user = 'netology'
mysql_db_name = 'netology_legacy_development'
mysql_host = '127.0.0.1'

database_config = {
    adapter: 'mysql2',
    encoding: 'utf8',
    pool: 5,
    username: mysql_user,
    # password: mysql_password,
    host:     mysql_host,
    database: mysql_db_name
}

connection_pool = ActiveRecord::Base.establish_connection(database_config)
p "tables_count:       #{ActiveRecord::Base.connection.tables.count}"

connection = connection_pool.connection
p "tables_count:       #{connection.tables.count}"
p "users_count: #{connection.execute('SELECT * FROM users').count}"


class User < ActiveRecord::Base 
  # Тут могут быть валидации, скоупы, константы, что угодно чтобы работать через модели
end
p "users_count: #{User.count}"
