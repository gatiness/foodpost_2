require 'rails_helper'
RSpec.describe 'Admin', type: :system do

  let!(:user) { create(:user) }
  let!(:user3) { create(:user3) }
  let!(:post) {create(:post,user_id: user.id)}
  let!(:post2) {create(:post2,user_id: user3.id)}
  let!(:comment) {create(:comment,post_id: post2.id,user_id: user.id)}
  let!(:favorite) {create(:favorite, post_id:post2.id, user_id:user.id)}

  
  before do
    visit root_path
    find_by_id('admin').click
    click_on '管理者画面'
  end
  describe '管理者権限の機能確認' do
    context '管理者画面でユーザー情報編集した場合' do
      it 'ユーザー情報を編集できる' do
        find('.nav-pills').find_link('ユーザー').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
        find_by_id("user_email").set "hensyuu@docomo.ne.jp"
        click_button '保存'
        expect(page).to have_content 'ユーザーの 更新しました に成功しました'
      end
    end
    context 'ユーザーを削除ボタンを押した場合' do
      it '指定したユーザーを削除できる' do
        find('.nav-pills').find_link('ユーザー').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(2) td:nth-child(9)').find(".list-inline").find_link('削除').click
        click_on('はい。間違いありません！')
        expect(page).to have_content 'ユーザーの 削除しました に成功しました'
      end
    end
    context 'コメント編集ボタンを押す' do
      it 'コメントを編集できる' do
        find('.nav-pills').find_link('コメント').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(8)').find(".list-inline").find_link('編集').click
        find_by_id('comment_comment').set "編集しましたよ〜〜〜"
        click_button '保存'
        expect(page).to have_content 'コメントの 更新しました に成功しました'
      end
    end
    context 'コメント削除ボタンを押す' do
      it 'コメントを削除できる' do
        find('.nav-pills').find_link('コメント').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(8)').find(".list-inline").find_link('削除').click
        click_on('はい。間違いありません！')
        expect(page).to have_content 'コメントの 削除しました に成功しました'
      end
    end
    context 'お気に入りを削除ボタンを押す' do
      it 'お気に入り登録を削除できる' do
        find('.nav-pills').find_link('Favorite').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(7)').find(".list-inline").find_link('削除').click
        click_on('はい。間違いありません！')
        expect(page).to have_content 'Favoriteの 削除しました に成功しました'
      end
    end
  end
end