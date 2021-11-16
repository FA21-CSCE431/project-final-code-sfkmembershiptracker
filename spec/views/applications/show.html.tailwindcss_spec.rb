require 'rails_helper'

RSpec.describe 'applications/show', type: :view do
  before do
    @application = assign(:application, Application.create!(
                                          first_name: 'First Name',
                                          last_name: 'Last Name',
                                          email: 'Email',
                                          phone: 'Phone',
                                          status: 'Status',
                                          question: 'Question'
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Question/)
  end
end
