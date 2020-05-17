require 'rails_helper'

describe User do
  describe '#create' do
    context '登録ができない' do

      it "nameがない場合は登録できないこと" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
    

      it "emailがない場合は登録できないこと" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("が入力されていません。")
      end

      it "passwordがない場合は登録できないこと" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("が入力されていません。")
      end

      it "password_confirmationがない場合は登録できないこと" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "passwordが6文字未満の場合登録できない事" do
        user = build(:user, password: "eeeee", password_confirmation: "eeeee")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
      end
    end

    context '投稿ができる' do

      it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "passwordが6文字以上の場合登録できる事" do
        user = build(:user, password: "123456789", password_confirmation: "123456789")
        expect(user).to be_valid
      end

    end
  end
end