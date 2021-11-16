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

RSpec.describe Event do
  subject do
    described_class.new(name: 'Meeting 1', event_type: 'Meeting', date: '11-15-2021', location: 'MSC', points: 1, confirmation_code: 'test')
  end

  # it 'is valid with valid attributes' do
  #   expect(subject).to be_valid
  # end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an event type' do
    subject.event_type = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an location' do
    subject.location = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without points' do
    subject.points = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an confirmation code' do
    subject.confirmation_code = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe SfkInfo do
  subject do
    described_class.new(mission: 'This is our mission.', history: 'This is our history.', ig_link: 'testlink')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without mission' do
    subject.mission = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without history' do
    subject.history = nil
    expect(subject).not_to be_valid
  end

  # it 'is not valid without instagram link' do
  #   subject.ig_link = nil
  #   expect(subject).not_to be_valid
  # end
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

RSpec.describe BlogPost, type: :model do
  subject do
    described_class.new(name: 'John Doe', position: 'Officer', message: 'This is a test announcement')
  end
  
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
  
  it 'is not valid without a position' do
    subject.position = nil
    expect(subject).not_to be_valid
  end
  
  it 'is not valid without a message' do
    subject.message = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Member, type: :model do
  test_position = Position.new(role: "President", can_change_positions: "true", can_change_events: "true", can_change_roster: "true", member: "true", officer: "true")
  test_user = User.new(uid: '110248495921238986420', full_name: 'John Doe', avatar_url: 'https://google.com', email: "jdoe@example.com")
  subject do
    described_class.new(email: 'jdoe@example.com', full_name: 'John Doe', phone: '6054756968', bio: 'Awesome bio', grad_date: 'May 2022', points: '5', position: test_position, user: test_user)
  end
  
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  
  it 'is not valid without an email' do
    subject.email = nil
	expect(subject).not_to be_valid
  end
  
  # it 'is not valid without a name' do
    # subject.full_name = nil
	# expect(subject).not_to be_valid
  # end
  
  it 'is valid without a phone number' do
    subject.phone = nil
	expect(subject).to be_valid
  end
  
  it 'is valid without a bio' do
    subject.bio = nil
	expect(subject).to be_valid
  end
  
  it 'is valid without an graduation date' do
    subject.grad_date = nil
	expect(subject).to be_valid
  end
  
  it 'is valid without points' do
    subject.points = nil
	expect(subject).to be_valid
  end
  
  it 'is not valid without a position' do
    subject.position = nil
	expect(subject).not_to be_valid
  end
  
  it 'is not valid without a user' do
    subject.user = nil
	expect(subject).not_to be_valid
  end
  
  subject do
    described_class.new(email: 'jdoe@example.com', full_name: 'John Doe', phone: '6054756968', bio: 'Awesome bio', grad_date: 'May 2022', position: test_position, user: test_user)
  end
  
  it 'is valid with default attributes' do
    expect(subject).to be_valid
  end
end