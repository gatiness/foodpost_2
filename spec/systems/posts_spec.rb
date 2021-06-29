require 'rails_helper'
RSpec.describe 'Post', type: :system do
  describe 'New post' do
    let!(:user){FactoryBot.create(:user)}
    let!(:user3){FactoryBot.create(:user3)}

    let!(:post){FactoryBot.create(:post, user_id:user.id)}
    let!(:post2){FactoryBot.create(:post2, user_id:user3.id)}
    let!(:post3){FactoryBot.create(:post3, user_id:user3.id)}
    let!(:comment){FactoryBot.create(:comment,post_id:post3.id,user_id:user.id)}
    
    before do
      visit new_user_session_path
      fill_in "user[email]", with: 'aaa@amail.com'
      fill_in "user[password]", with: '1111pppp'
      click_button 'commit'
      click_on 'ホーム'
    end
    context "when new task gets created" do
      it 'appears in the index page' do
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
        sleep(0.1)
        first(:link, '削除').click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'
      end
    end
    context "投稿者本人が" do
      it '投稿を編集できる' do
        sleep(0.8) 
        first(:link, '編集').click
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
        click_on('commit')
        expect(page).to have_content 'チンパンジー'
        expect(page).to have_content 'ねこ'
        expect(page).not_to have_content 'content 1'
      end
    end
  end
  describe 'New post' do
    context "投稿内容で" do
      it 'お気に入り機能' do
        FactoryBot.create(:user)
        user3 = FactoryBot.create(:user3)
        FactoryBot.create(:post3, user_id:user3.id)
        visit new_user_session_path
        fill_in "user[email]", with: 'aaa@amail.com'
        fill_in "user[password]", with: '1111pppp'
        click_button 'commit'
        click_on 'ホーム'
        sleep(0.8) 
        first(:link, '詳細').click
        sleep(0.8)
        click_on '♡お気に入り'
        expect(page).to have_content 'お気に入りしました'
      end
    end
  end
end