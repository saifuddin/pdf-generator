# if ARGV.empty?
#   puts "Cannot go on without table name"
#   exit
# end

require 'yaml'
require './gems/activerecord/lib/active_record'
require './gems/json/lib/json'

configuration = YAML::load(IO.read('./database.yml'))
ActiveRecord::Base.establish_connection(configuration['database'])

class TableA < ActiveRecord::Base
  configuration = YAML::load(IO.read('./database.yml'))
  self.table_name = configuration['database']['tablename']
end

p "Writing to ./data.json.."
File.write("./data.json", TableA.all.to_json)