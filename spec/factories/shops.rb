# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    name { 'コーヒーショップ' }
    address { '東京都港区○○○　△−△−△　コーヒーショップ' }
    url { 'https://coffeeshop.com' }
  end
end
