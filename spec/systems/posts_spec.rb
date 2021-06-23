require 'rails_helper'
RSpec.describe 'Post', type: :system do
  let!(:user){FactoryBot.create(:user)}
  let!(:post){FactoryBot.create(:post, user_id:user.id)}
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
        # binding.irb
        first('tr td:nth-child(7)').click
        sleep(0.5)
        page.driver.browser.switch_to.alert.accept
        # click_button 'Delete'
        expect(page).to have_content '削除しました'
      end
    end
    context "投稿者本人が" do
      it '投稿を編集できる' do
        first('tr td:nth-child(6)').click 
        fill_in "post[title]", with: 'post 3'
        fill_in "post[content]", with: 'content 3'
        click_button '投稿する'
        expect(page).to have_content 'post 3'
        expect(page).to have_content 'content 3'
      end
    end
    context "文章と画像で" do
      it 'フード投稿ができる' do
        click_on '新規投稿' 
        fill_in "post[title]", with: 'post 3'
        fill_in "post[content]", with: 'content 3'
        attach_file 'post[image]', 'app/assets/images/post_images/image1.png'
        click_button '投稿する'
        expect(page).to have_content 'post 3'
        expect(page).to have_content 'content 3'
        expect(page).to have_selector("img[src$='image1.png']")
      end
    end
  end
end

    # to have contentを別のmatcherにしないといけないっぽい？
#     context "タイトルで" do　
#       it 'フード投稿が検索できる' do
#         post2 = FactoryBot.create(:post2, user_id:user.id)
#         post3 = FactoryBot.create(:post3, user_id:user.id)
#         # binding.irb
#         fill_in "q[content_cont]", with: 'post 2'
#         fill_in "q[content_cont]", with: 'post 3'
#         click_on 'commit'
#         expect(page).to have_content 'post 2' 
#         expect(page).to have_content 'post 3'
#         expect(page).not_to have 'post 1'
#       end
#     end
#   end
# end