require 'rails_helper'
RSpec.describe 'guest_login', type: :system do
  describe 'ゲストログイン機能' do
    context 'トップページのゲストログインボタンから' do
      it 'ゲストユーザーとしてログインできる' do
        visit root_path
        # binding.irb
        click_link 'ゲストログイン'
        click_on 'ホーム'
        expect(page).to have_content 'ゲストユーザーとしてログインしました！'
      end
    end
  end
end

#ボタンがinvisibleなやつ。あとlet upshotとかいるのかわからない
