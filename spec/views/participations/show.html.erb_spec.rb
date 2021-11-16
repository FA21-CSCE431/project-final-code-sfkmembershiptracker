require 'rails_helper'

RSpec.describe 'participations/show', type: :view do
  before do
    @participation = assign(:participation, Participation.create!(
                                              event_id: '',
                                              member_email: 'Member Email',
                                              user_code: 'User Code'
                                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Member Email/)
    expect(rendered).to match(/User Code/)
  end
end
