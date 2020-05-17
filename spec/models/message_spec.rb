require 'rails_helper'

describe Message, type: :model do
  describe '#create' do
    context '送信ができない' do

      it "contentが空の場合送信できない事" do
        message = build(:message, content: "")
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end

      it "to_idがnilの場合送信できない事" do
        message = build(:message, to_id: nil)
        message.valid?
        expect(message.errors[:to_id]).to include("を入力してください")
      end

      it "user_idがnilの場合送信できない事" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end

    end

    context '送信ができる' do

      it "contentとto_idとuser_idが存在すれば送信できること" do
        message = build(:message)
        expect(message).to be_valid
      end

    end
  end
end