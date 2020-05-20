require 'rails_helper'

describe Post, type: :model do
  describe '#create' do
    context '投稿ができない' do
      it "titleが空の場合は登録できないこと" do
        post = build(:post, title: "")
        post.valid?
        expect(post.errors[:title]).to include("を入力してください")
      end

      it "contentが空の場合は登録できないこと" do
        post = build(:post, content: "")
        post.valid?
        expect(post.errors[:content]).to include("を入力してください")
      end

      it "feeが空の場合は登録できないこと" do
        post = build(:post, fee: "")
        post.valid?
        expect(post.errors[:fee]).to include("を入力してください")
      end

      it "user_idがnilの場合は登録できないこと" do
        post = build(:post, user_id: nil)
        post.valid?
        expect(post.errors[:user]).to include("を入力してください")
      end
    end

    context '投稿ができる' do
      it "title、content、fee、user_idが存在すれば登録できること" do
        post = build(:post)
        expect(post).to be_valid
      end
    end
  end
end
