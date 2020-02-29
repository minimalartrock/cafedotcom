# frozen_string_literal: true

require 'rails_helper'

describe '店舗情報管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザーAを作成しておく
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      # 店舗を全件作成しておく
      shop_a = FactoryBot.create(:shop, name: 'コーヒーショップA', address: '東京都港区○○○　△−△−△　コーヒーショップA')
      shop_b = FactoryBot.create(:shop, name: 'コーヒーショップB', address: '東京都港区○○○　△−△−△　コーヒーショップB')
      shop_c = FactoryBot.create(:shop, name: 'コーヒーショップC', address: '東京都港区○○○　△−△−△　コーヒーショップC')
      shop_d = FactoryBot.create(:shop, name: 'コーヒーショップD', address: '東京都港区○○○　△−△−△　コーヒーショップD')
      shop_e = FactoryBot.create(:shop, name: 'コーヒーショップE', address: '東京都港区○○○　△−△−△　コーヒーショップE')
    end

    context 'ユーザーAがログインしているとき' do
      before do
        # ユーザーAでログインする
        visit user_session_path
        fill_in 'user_email', with: 'a@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログインする'
      end

      it '店舗が全件表示される' do
        # 店舗の名称が全件画面上に表示されていることを確認
        expect(page).to have_content 'コーヒーショップA'
      end
    end
  end
end
