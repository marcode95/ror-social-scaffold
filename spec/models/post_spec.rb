require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'should belong to user' do
    should belong_to(:user)
  end

  it 'should have many comments' do
    should have_many(:comments)
  end

  it 'should have many likes' do
    should have_many(:likes)
  end
end