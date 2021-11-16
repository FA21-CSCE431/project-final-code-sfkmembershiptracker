require 'rails_helper'

RSpec.describe 'events/new', type: :view do
  before do
    assign(:event, Event.new(
                     name: 'MyString',
                     location: 'MyString',
                     points: ''
                   ))
  end

  it 'renders new event form' do
    render

    assert_select 'form[action=?][method=?]', events_path, 'post' do
      assert_select 'input[name=?]', 'event[name]'

      assert_select 'input[name=?]', 'event[location]'

      assert_select 'input[name=?]', 'event[points]'
    end
  end
end
