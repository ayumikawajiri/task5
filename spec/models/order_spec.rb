require 'rails_helper'

RSpec.describe Order, type: :model do

  context '必須項目が全て入力されている' do
  	it 'バリデーション通過' do
  	  valid_order = build(:order)
  	  expect(valid_order).to be_valid
  	end
  end

  context '購入者氏名がnilの場合' do
  	it 'ordernameのバリデーションに通過しない' do
  	  ordername_nil_order = build(:order, ordername: nil)
  	  expect(ordername_nil_order).to be_invalid
  	end
  end

  context '連絡先がnilの場合' do
  	it 'orderphoneのバリデーションに通過しない' do
  	  orderphone_nil_order = build(:order, orderphone: nil)
  	  expect(orderphone_nil_order).to be_invalid
  	end
  end

  context '連絡先が10桁もしくは11桁でない場合' do
  	it 'orderphoneのバリデーションに通過しない' do
      orderphone_invalid_order = build(:order, orderphone: "12345")
      expect(orderphone_invalid_order).to be_invalid
  	end
  end

  context 'メールアドレスがnilの場合' do
  	it 'orderemailのバリデーションに通過しない' do
  	  orderemail_nil_order = build(:order, orderemail: nil)
  	  expect(orderemail_nil_order).to be_invalid
  	end
  end

  context 'メールアドレスが不適切な場合' do
  	it 'orderemailのバリデーションに通過しない' do
      orderemail_invalid_order = build(:order, orderemail: "abcde")
      expect(orderemail_invalid_order).to be_invalid
  	end
  end

  context '送付先住所がnilの場合' do
  	it 'orderaddressのバリデーションに通過しない' do
  	  orderaddress_nil_order = build(:order, orderaddress: nil)
  	  expect(orderaddress_nil_order).to be_invalid
  	end
  end
end