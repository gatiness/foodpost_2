require 'rails_helper'
RSpec.describe 'Post', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:user3){FactoryBot.create(:user3)}

  let!(:post){FactoryBot.create(:post, user_id:user.id)}
  let!(:post2){FactoryBot.create(:post2, user_id:user3.id)}
  let!(:post3){FactoryBot.create(:post3, user_id:user3.id)}
  # post2 = FactoryBot.create(:post2, user_id:user.id)
  # post3 = FactoryBot.create(:post3, user_id:user.id)

  before do
    visit new_user_session_path
    fill_in "user[email]", with: 'aaa@amail.com'
    fill_in "user[password]", with: '1111pppp'
    click_button 'commit'
    click_on 'ホーム'
  end
  describe 'New post' do
    context "when new task gets created" do
      it 'appears in the index page' do
        # binding.irb
        click_on '新規投稿'
        fill_in "post[title]", with: 'post 1'
        fill_in "post[content]", with: 'content 1'
        click_on '投稿する'
        expect(page).to have_content 'post 1'
        expect(page).to have_content 'content 1'
      end
    end
    context "投稿者本人が" do
      it '投稿を削除できる' do
        sleep(0.8)
        first('tr td:nth-child(8)').click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'
      end
    end
    context "投稿者本人が" do
      it '投稿を編集できる' do
        sleep(0.8) 
        first('tr td:nth-child(7)').click
        fill_in "post[title]", with: '内容3'
        fill_in "post[content]", with: 'ねこ'
        click_button '投稿する'
        expect(page).to have_content '内容3'
        expect(page).to have_content 'ねこ'
      end
    end
    context "文章と画像で" do
      it 'フード投稿ができる' do
        click_on '新規投稿' 
        fill_in "post[title]", with: '内容3'
        fill_in "post[content]", with: 'ねこ'
        attach_file 'post[image]', 'app/assets/images/post_images/image1.png'
        click_button '投稿する'
        expect(page).to have_content '内容3'
        expect(page).to have_content 'ねこ'
        expect(page).to have_selector("img[src$='image1.png']")
      end
    end
    context "投稿内容で" do
      it 'フード投稿が検索できる' do
        fill_in "q[content_cont]", with: '内容'
        find('#search_post').click
        expect(page).to have_content 'チンパンジー'
        expect(page).to have_content 'ねこ'
        expect(page).not_to have_content 'content 1'
      end
    end
    context "投稿内容で" do
      it 'お気に入り機能' do
        first('tr td:nth-child(8)').click
        sleep(1)
        page.driver.browser.switch_to.alert.accept
        first('tr td:nth-child(6)').click
        click_on '♡お気に入り'
        expect(page).to have_content 'お気に入りしました'
        expect(page).to have_content 'Remove from favorite'
      end
    end
  end
end