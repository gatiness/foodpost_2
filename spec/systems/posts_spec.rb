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
        binding.irb
        first('tr:nth-child(2) td:nth-child(6)').click
        sleep(0.1)
        click_on '♡お気に入り'
        expect(page).to have_content 'お気に入りしました'
      end
    end
    context "投稿内容で" do
      it 'コメント投稿機能' do
        # binding.irb
        first('tr:nth-child(2) td:nth-child(6)').click
        sleep(0.1)
        fill_in "comment[comment]", with: 'test'
        click_on 'コメントする'
        expect(page).to have_content 'test'
      end
    end
    context "投稿内容で" do
      it 'コメント編集機能' do
        first('tr:nth-child(2) td:nth-child(6)').click
        sleep(0.1)
        fill_in "comment[comment]", with: 'test'
        click_on 'コメントする'
        click_on 'コメント編集'
        sleep(0.1)
        # binding.irb
        find('textarea#comment_edit_2').set('test2')
        sleep(0.1)
        click_on '更新する'
        expect(page).to have_content 'hitest2'
        # find('textarea#comment_edit_2').set('')
        # comment_edit_#{comment.id}", with: 'test'
#         fill_in find_by_id("topics-index_row-#{topic.id}_edit").click
# expect(find_by_id("topics-index_row-#{topic.id}_title")).to have_content title
      end
    end
    context "投稿内容で" do
      it 'コメント削除機能' do
        first('tr:nth-child(2) td:nth-child(6)').click
        sleep(0.1)
        fill_in "comment[comment]", with: 'test'
        click_on 'コメントする'
        click_on 'コメント削除'
        expect(page).to have_content 'コメントが削除されました'
      end
    end
  end
end