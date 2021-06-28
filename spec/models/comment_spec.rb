require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe 'commentモデル機能' do
    context 'バリデーションテスト' do
      it 'コメントが空の場合' do
        user2 = create(:admin)
        user = create(:user)
        post3 = create(:post3, user_id: user2.id)
        comment = Comment.new(comment: nil, user_id: user2.id, post_id: post3.id)
        expect(comment).to be_invalid
      end
    end
    context 'コメント投稿に成功した場合' do
      it 'コメントが表示される' do
        user2 = create(:admin)
        user = create(:user)
        post3 = create(:post3, user_id: user2.id)
        comment = Comment.new(comment: "コメントしました！", user_id: user2.id, post_id: post3.id)
        expect(comment).to be_valid
      end
    end
  end
end