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

  it 'is not valid without an email address' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid with an invalid email address' do
    subject.email = "not_an_email_address"
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

RSpec.describe Position, type: :model do
  subject do
    described_class.new(role: "President", can_change_positions: "true", can_change_events: "true", can_change_roster: "true", member: "true", officer: "true")
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.role = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without positions permissions defined' do
    subject.can_change_positions = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without events permission defined' do
    subject.can_change_events = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without roster permissions defined' do
    subject.can_change_roster = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without member defined' do
    subject.member = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without officer defined' do
    subject.officer = nil
    expect(subject).not_to be_valid
  end

  subject do
    described_class.new(role: "Applicant")
  end

  it 'is valid with default attributes' do
    expect(subject).to be_valid
  end

  it 'has default positions permissions' do
    assert_equal(subject.can_change_positions, false)
  end
  
  it 'has default events permissions' do
    assert_equal(subject.can_change_events, false)
  end
  
  it 'has default roster permissions' do
    assert_equal(subject.can_change_roster, false)
  end
  
  it 'has default member status' do
    assert_equal(subject.member, true)
  end
  
  it 'has default officer status' do
    assert_equal(subject.officer, false)
  end
end