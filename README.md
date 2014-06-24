# Quby::Mongoid

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'quby-mongoid'

And then execute:

    $ bundle

## Usage

To configure Quby to use this database adapter for storage, perform the following somewhere during your application's initialization process:

    Quby.answer_repo = Quby::AnswerRepos::MongoidRepo.new

## Contributing

1. Fork it ( https://github.com/[my-github-username]/quby-mongoid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
