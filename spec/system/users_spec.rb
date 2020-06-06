# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザー情報管理機能', type: :system do
  describe 'ログイン機能' do
    before do
      # ユーザーAを作成しておく
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
    end

    context 'ユーザーAがログインするとき' do
      before do
        # ユーザーAでログインする
        visit login_path
        fill_in 'email', with: 'a@example.com'
        fill_in 'password', with: 'password'
        click_button 'ログイン'
      end

      it 'トップページへ遷移する' do
        # トップページへ遷移することを確認する
        expect(page).to have_current_path root_path
      end
    end
  end
end
