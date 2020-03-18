# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Thought, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:thought_hashtags) }
  it { is_expected.to have_many(:hashtags).through(thought_hashtags) }
end
