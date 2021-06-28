require 'rails_helper'
RSpec.describe 'ラベル登録機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, user_id:user.id) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:label) { FactoryBot.create(:label) }
  let!(:second_label) { FactoryBot.create(:second_label) }
  let!(:third_label) { FactoryBot.create(:third_label) }
  let!(:labeling) { FactoryBot.create(:labeling, post_id:post.id, label_id:label.id) }
  describe '新規タスクにラベルをつける機能' do
    before do
      visit root_path
      click_on 'ログイン'
      fill_in :user_email, with: 'aaa@amail.com'
      fill_in :user_password, with: '1111pppp'
      click_button 'ログイン'
    end
    # context 'タスクの新規作成時にラベルを選んだ場合' do
    #   it 'タスクといっしょにラベルも表示される' do
    #     FactoryBot.create(:label)
    #     FactoryBot.create(:second_label)
    #     FactoryBot.create(:third_label)
    #     visit new_task_path
    #     fill_in "task_name", with: "task5"
    #     fill_in "task_description", with: "desc5"
    #     click_button 'タスクを作成'
    #     expect(page).to have_content 'task5'
    #     expect(page).to have_content 'test3'
    #   end
    # end
    # context 'ラベルで検索したら' do
    #   it 'そのラベルと紐づいてる投稿が表示される' do
        
    #     # select "test3", from: :label_id
    #     # check('test')
    #     # click_link('test')
    #     # select(value=) 'test'
    #     # first("#post_search").find("checkbox[value='13']").select_option
    #     # select "test", from: "ja"
    #     click_button '検索'
    #     expect(current_path).to have_content "/tasks"
    #     expect(page).to have_content 'test3'
    #   end
    # end
  end
end
