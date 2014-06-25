require 'spec_helper'
require 'quby/answer_repos/specs'
require 'quby/api/specs/answers_api_specs'

describe Quby::AnswerRepos::MongoidRepo do
  it_behaves_like 'an answer repository'
  it_behaves_like 'a valid backend for the answers api'
end
