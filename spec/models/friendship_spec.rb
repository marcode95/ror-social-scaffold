require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @marco = User.create!(name: 'Marco', email: 'marco@gmail.com', password: 'marcomarco', id: 1)
    @bello = User.create!(name: 'Bello', email: 'bello@gmail.com', password: 'bellobello', id: 2)
    @friendship = Friendship.create!(user_id: 1, friend_id: 2, confirmed: true)
  end

  context 'simple functions' do
    it 'creates friendships' do
      expect(Friendship.first).to eq(@friendship)
    end
  end
end
