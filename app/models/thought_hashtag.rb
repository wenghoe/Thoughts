# frozen_string_literal: true

class ThoughtHashtag < ApplicationRecord
  belongs_to :thought
  belongs_to :hashtag
end
