require 'quby/mongoid'
Quby.questionnaires_path = File.expand_path("../fixtures", __FILE__)

require 'mongoid'
Mongoid.load!(File.expand_path("../../config/mongoid.yml", __FILE__), :test)

require 'database_cleaner'
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:mongoid].clean_with(:truncation)
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
