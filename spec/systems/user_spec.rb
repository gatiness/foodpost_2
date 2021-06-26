require 'rails_helper'
RSpec.describe 'user関連機能', type: :system do
  # let(:user) { create(:user) }
  # let(:admin) { create(:admin) }
  let(:user3) { create(:user3) }
  before do
    visit root_path
  end
  describe 'devise関連機能' do
    context 'ユーザーが全ての項目に適切な値を入力したら'
    it 'サインアップできる' do
      click_on '新規登録'
      fill_in 'user[name]', with: 'チンチラ'
      fill_in 'user[email]', with: 'chinchilla@cmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'commit'
      expect(page).to have_content '新規投稿'
    end

    it 'ログイン機能' do
      click_on '新規登録'
      fill_in 'user[name]', with: 'チンチラ'
      fill_in 'user[email]', with: 'chinchilla@cmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'commit'
      click_on 'ログアウト'
      click_on 'ログイン'
      fill_in 'user[email]', with: 'chinchilla@cmail.com'
      fill_in 'user_password', with: 'password'
      click_on 'commit'
      expect(page).to have_content '新規投稿'
    end
  end
end
