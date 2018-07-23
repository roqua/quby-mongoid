ENV["RAILS_ENV"]   = "test"
ENV["RACK_ENV"]    = "test"
ENV["MONGOID_ENV"] = "test"

require 'quby/mongoid'
Quby.questionnaire_repo = Quby::Questionnaires::Repos::DiskRepo.new(Quby.fixtures_path)
Quby.answer_repo = Quby::Answers::Repos::MongoidRepo.new

require 'mongoid'
if ::Mongoid::VERSION > '6'
  Mongoid.load!(File.expand_path("../../config/mongoid6.yml", __FILE__), :test)
elsif ::Mongoid::VERSION > '5'
  Mongoid.load!(File.expand_path("../../config/mongoid5.yml", __FILE__), :test)
elsif ::Mongoid::VERSION > '4'
  Mongoid.load!(File.expand_path("../../config/mongoid4.yml", __FILE__), :test)
else
  raise 'Not supported'
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
