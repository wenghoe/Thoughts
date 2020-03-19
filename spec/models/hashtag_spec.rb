# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  it { is_expected.to have_many(:thought_hashtags) }
  it { is_expected.to have_many(:thoughts).through(:thought_hashtags) }
end
