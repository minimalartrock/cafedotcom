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
        visit user_session_path
        fill_in 'user_email', with: 'a@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログインする'
      end

      it 'トップページへ遷移する' do
        # トップページへ遷移することを確認する
        expect(page).to have_current_path '/'
      end
    end

    context 'ユーザーBがログインするとき' do
      before do
        # ユーザーBでログインする
        visit user_session_path
        fill_in 'user_email', with: 'b@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログインする'
      end

      it 'エラーメッセージを表示し自画面を再表示する' do
        # エラーメッセージが表示されることを確認する
        expect(page).to have_selector '.alert.alert-danger', text: 'メールアドレスまたはパスワードが違います。'
      end
    end

    context 'Twitterでログインするとき' do
      before do
        visit user_session_path
        click_button 'icon-twitter'
      end

      it 'Twitterへ遷移する' do
        # Twitterへ遷移することを確認する
        current_url.to eq('http://localhost:3000/users/auth/twitter')
      end
    end
  end
end
