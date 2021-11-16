require 'rails_helper'

RSpec.describe 'payments/edit', type: :view do
  before do
    @payment = assign(:payment, Payment.create!(
                                  member_id: 1,
                                  amount: '9.99',
                                  description: 'MyString'
                                ))
  end

  it 'renders the edit payment form' do
    render

    assert_select 'form[action=?][method=?]', payment_path(@payment), 'post' do
      assert_select 'input[name=?]', 'payment[member_id]'

      assert_select 'input[name=?]', 'payment[amount]'

      assert_select 'input[name=?]', 'payment[description]'
    end
  end
end
