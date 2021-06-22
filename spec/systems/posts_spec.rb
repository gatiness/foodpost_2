require 'rails_helper'
RSpec.describe 'Post', type: :system do

  describe 'New post' do
    context "when new task gets created" do
      it 'appears in the index page' do
        visit posts_path
        click_on '新規投稿'
        fill_in :title, with: 'title 1'
        fill_in :content, with: 'content 1'
        click_button '投稿する'
        expect(page).to have_content 'post 1'
        expect(page).to have_content 'content 1'
      end
    end
    context "投稿者本人が" do
      it '投稿を削除できる' do
        visit posts_path
        click_on 'Delete'
        click_button 'Delete'
        expect(page).to have_content '削除しました'
      end
    end
    context "投稿者本人が" do
      it '投稿を編集できる' do
        visit posts_path
        click_on 'Edit' 
        fill_in :title, with: 'post 2'
        fill_in :content, with: 'post 2'
        click_button '投稿する'
        expect(page).to have_content 'post 2'
        expect(page).to have_content 'content 2'
      end
    end
    context "文章と画像で" do
      it 'フード投稿ができる' do
        visit posts_path
        click_on '新規投稿' 
        fill_in :title, with: 'post 3'
        fill_in :content, with: 'post 3'
        attach_file 'image1.png'
        click_button '投稿する'
        expect(page).to have_content 'post 3'
        expect(page).to have_content 'content 3'
        expect(page).to have_selector("img[src$='image1.png']")

      end
    end
  end
end