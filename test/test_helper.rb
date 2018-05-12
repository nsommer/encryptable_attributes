$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'encryptable_attributes'
require 'active_record'
require 'models/user'

require 'minitest/autorun'

def db_configuration
  db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration['test'])
