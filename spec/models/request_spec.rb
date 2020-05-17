require 'rails_helper'

describe Request, type: :model do
  describe '#create' do
    context '送信ができない' do

      it "statusがnilの場合は送信できないこと" do
        request = build(:request, status: nil)
        request.valid?
        expect(request.errors[:status]).to include("を入力してください")
      end
      
      it "statusが1以外の場合は送信できないこと" do
        request = build(:request, status: 2)
        request.valid?
        expect(request.errors[:status]).to include("は1にしてください")
      end

      it "to_idがnilの場合は送信できないこと" do
        request = build(:request, to_id: nil)
        request.valid?
        expect(request.errors[:to_id]).to include("を入力してください")
      end

      it "user_idがnilの場合は送信できないこと" do
        request = build(:request, user_id: nil)
        request.valid?
        expect(request.errors[:user]).to include("を入力してください")
      end

    end
    
    context '送信ができる' do

      it "statusが1で、to_idとuser_idが存在すれば送信できること" do
        request = build(:request)
        expect(request).to be_valid
      end

    end
  end
end