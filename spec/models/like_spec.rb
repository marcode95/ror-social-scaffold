require 'rails_helper'

RSpec.describe Like, type: :model do

  it 'should belong to user' do
    should belong_to(:user)
  end

  it 'should belong to post' do
    should belong_to(:post)
  end

end