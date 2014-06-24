require 'spec_helper'
require 'quby/answer_repos/specs'

describe Quby::AnswerRepos::MongoidRepo do
  it_behaves_like "an answer repository"
end
