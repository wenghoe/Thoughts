# frozen_string_literal: true

class Hashtag < ApplicationRecord
  has_many :thought_hashtags
  has_many :thoughts, through: :thought_hashtags
end
