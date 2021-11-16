require 'rails_helper'

RSpec.describe 'payments/show', type: :view do
  before do
    @payment = assign(:payment, Payment.create!(
                                  member_id: 2,
                                  amount: '9.99',
                                  description: 'Description'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Description/)
  end
end
