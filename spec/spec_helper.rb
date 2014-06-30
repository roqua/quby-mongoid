ENV["RAILS_ENV"]   = "test"
ENV["RACK_ENV"]    = "test"
ENV["MONGOID_ENV"] = "test"

require 'quby/mongoid'
Quby.questionnaires_path = Quby.fixtures_path
Quby.answer_repo = Quby::Answers::Repos::MongoidRepo.new

require 'mongoid'
if ::Mongoid::VERSION > '4'
  Mongoid.load!(File.expand_path("../../config/mongoid4.yml", __FILE__), :test)
elsif ::Mongoid::VERSION > '3'
  Mongoid.load!(File.expand_path("../../config/mongoid3.yml", __FILE__), :test)
else
  Mongoid.load!(File.expand_path("../../config/mongoid2.yml", __FILE__))
end

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
