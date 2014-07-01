require 'spec_helper'
require 'quby/answers/specs'

describe Quby::Answers::Repos::MongoidRepo do
  it_behaves_like 'an answer repository'
  it_behaves_like 'a valid backend for the answers api'
end
