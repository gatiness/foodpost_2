require 'rails_helper'
RSpec.describe 'user関連機能', type: :system do
  user = FactoryBot.create(:user, name:'araba', email: 'aaa@amail.com', password:'1111pppp')
  before do
    visit root_path
  end

  describe 'devise関連機能' do
    it 'サインアップ機能' do
      visit new_user_registration_path
      # binding.irb
      fill_in '名前', with: 'araba'
      fill_in 'Eメール', with: 'aaa@amail.com'
      fill_in 'パスワード', with: '1111pppp'
      fill_in 'パスワード（確認用）', with: '1111pppp'
      click_button '登録する'
      expect(page).to have_content 'お気に入り一覧'
    end
  end

    it 'ログイン機能' do
      visit new_user_session_path
      fill_in 'Eメール', with: 'aaa@amail.com'
      fill_in 'パスワード', with: 'password'
      # binding.irb
      click_button 'ログイン'
      expect(page).to have_content 'お気に入り一覧'
    end
  end