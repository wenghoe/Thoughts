# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ThoughtHashtag, type: :model do
  it { is_expected.to belong_to(:thought) }
  it { is_expected.to belong_to(:hashtag) }
end
