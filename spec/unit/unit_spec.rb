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