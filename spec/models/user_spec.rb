require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @marco = User.create!(name: 'Marco', email: 'marco@gmail.com', password: 'marcomarco')
    @bello = User.create!(name: 'Bello', email: 'bello@gmail.com', password: 'bellobello')
  end

  context 'simple functions' do
    it 'creates users' do
      expect(User.first).to eq(@marco)
      expect(User.second).to eq(@bello)
    end

    it 'checks if they are friends or not' do
      expect(@marco.friend?(@bello)).to be(false)
    end
  end
end
