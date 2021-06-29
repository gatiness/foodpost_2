require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
  # let!(:second_item) { FactoryBot.create(:second_item, user: user) }
  let!(:user) {create(:user)}
  let!(:user3) {create(:user3)}
  let!(:post) {create(:post,user_id: user3.id)}
  let!(:post3) {create(:post3, user: user)}
  let!(:comment) {create(:comment,post_id: post.id,user_id: user.id)}
  let!(:comment2) {create(:comment2,post_id: post3.id,user_id: user.id)}

  before do
    visit root_path
    # binding.irb
    # find('#log_in').click
    click_on 'ログイン'
    fill_in :user_email, with: "#{user.email}"
    fill_in :user_password, with: "#{user.password}"
    click_button 'commit'
    visit posts_path
  end

  describe '投稿に対してコメントを投稿機能' do
    context '投稿にコメントした場合' do
      it '投稿にコメントが投稿される' do
        # binding.irb
        click_on '詳細', match: :first
        sleep(0.1)
        fill_in "comment[comment]", with: 'test'
        click_on 'コメントする'
        expect(page).to have_content 'test'
      end
    end

    context '投稿したコメントの編集ボタンを押した場合' do
      it 'コメントを編集できる' do
        click_on '詳細', match: :first
        # binding.irb
        click_on 'コメント編集'
        expect(page).to have_content 'comment1'
        find_by_id("comment_edit_row-#{comment.id}").set('コメントを編集しました')
        click_on '更新する'
        expect(page).to have_content 'コメントを編集しました'
        expect(page).not_to have_content 'comment1'
      end
    end
    
    # context '投稿したコメントの編集ボタンを押した場合' do
    #   it 'コメントを編集できる' do
    #     sleep(0.1)
    #     # click_on '削除'
    #     # fill_in "comment[comment]", with: 'test'
    #     # click_on 'コメントする'
    #     sleep(0.1)
    #     # binding.irb
    #     fill_in "comment[comment]", with: 'test'
    #     click_on 'コメントする'
    #     click_on 'コメント編集'
    #     # find_by_id("comment_edit_row-#{comment.id}_btn").click
    #     # find_by_id("comment_edit_row-#{comment.id}").set("test2")
    #     # fill_in "#comment_edit_row-58", with: 'test2'     
    #     fill_in "comment[comment]", with: 'test2'
    #     sleep(0.1)
    #     click_on '更新する'
    #     expect(page).to have_content 'test2'
    #     sleep(0.1)
    #   end
    # end
    context '投稿したコメントの削除ボタンを押した場合' do
      it 'コメントを削除できる' do
        click_on "詳細", match: :first
        sleep(0.1)
        click_on 'コメント削除'
        expect(page).to have_content 'コメントが削除されました'
      end
    end
  end
end