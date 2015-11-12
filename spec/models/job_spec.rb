require 'rails_helper'

describe Job do
  it { should validate_presence_of(:posted) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:poster) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:keywords) }

  it { should have_valid(:state).when("RI") }
  it { should_not have_valid(:state).when("ripa") }
  it { should_not have_valid(:state).when("ma") }
end
