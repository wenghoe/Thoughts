class Thought < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :thought_hashtags
  has_many :hashtags, through: :thought_hashtags

  after_commit :create_hashtags, on: :create

  private
  
  def create_hashtags
    extract_name_hashtags.each do |name|
      hashtags.create(name: name)
    end
  end

  def extract_name_hashtags
    content.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end
end
