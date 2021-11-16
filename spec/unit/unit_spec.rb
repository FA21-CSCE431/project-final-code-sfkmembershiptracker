require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(uid: '110248495921238986420', full_name: 'John Doe', avatar_url: 'https://google.com', email: "jdoe@example.com")
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid without a name' do
    subject.full_name = nil
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is valid without a uid' do
    subject.uid = nil
    expect(subject).to be_valid
  end

  it 'is valid without an avatar URL' do
    subject.avatar_url = nil
    expect(subject).to be_valid
  end
end

Rspec.describe Events do
  subject do
    described_class.new(name: 'Meeting 1', event_type: 'Meeting', date: '11-15-2021', location: 'MSC', points: 1, confirmation_code: 'test')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be valid
  end

  it 'is not valid without an event type' do
    subject.event_type = nil
    expect(subject).not_to be valid
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect(subject).not_to be valid
  end

  it 'is not valid without an location' do
    subject.location = nil
    expect(subject).not_to be valid
  end

  it 'is not valid without points' do
    subject.points = nil
    expect(subject).not_to be valid
  end

  it 'is not valid without an confirmation code' do
    subject.confirmation_code = nil
    expect(subject).not_to be valid
  end
end

Rspec.describe SfkInfos do
  subject do
    described_class.new(mission: 'This is our mission.', history: 'This is our history.', ig_link: 'testlink')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without mission' do
    subject.mission = nil
    expect(subject).not_to be valid
  end

  it 'is not valid without history' do
    subject.history = nil
    expect(subject).not_to be valid
  end

  it 'is not valid without instagram link' do
    subject.ig_link = nil
    expect(subject).not_to be valid
  end
end