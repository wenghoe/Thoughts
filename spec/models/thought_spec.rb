require 'rails_helper'

RSpec.describe Thought, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to belong_to(:user) }
end
