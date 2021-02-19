require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation content' do
    it 'ensures content presence' do
      comment = Comment.new(content: '').save
      expect(comment).to eql(false)
    end

    it 'checks if belongs to User' do
      should belong_to(:post)
    end
  end
end