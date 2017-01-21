require 'rails_helper'

RSpec.describe User, :type => :model do

  it "Create new user" do
    user = FactoryGirl.create(:user)
    user.valid?
    expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
  end
  
  describe User do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

end