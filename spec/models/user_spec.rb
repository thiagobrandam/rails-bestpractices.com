require 'spec_helper'

describe User do

  include RailsBestPractices::Spec::Support
  should_be_gravastic

  it { should have_many(:posts) }
  it { should have_many(:votes) }
  it { should have_many(:questions) }
  it { should have_many(:answers) }
  it { should have_many(:notifications) }
  it { should have_many(:notification_settings) }

  context "validations" do
    before { Factory(:user) }
    it { should validate_presence_of(:login) }
    it { should validate_uniqueness_of(:login) }
  end

  it "should reflect :id & :login when converted to param" do
    user = Factory(:user, :login => 'flyerhzm')
    user.to_param.should == "#{user.id}-flyerhzm"
  end
end
