require 'rails_helper' #共通の設定の有効化

RSpec.describe Message, type: :model do #describeのネスト。
  describe '#create' do # 「Messageクラスにあるcreateメソッドをテストするまとまり」であることを示している
    
    context 'can save' do
      # bodyがあれば保存できることを確認
      it "is valid with body" do
        expect(build(:message, image: nil)).to be_valid
      end
      # imageがあれば保存できることを確認
      it "is valid with image" do
        expect(build(:message, body: nil)).to be_valid
      end
      # bodyとimageがあれば保存できることを確認
      it "is valid with body & image" do
        expect(build(:message)).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without body & image" do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:body]).to include("を入力してください")
      end

      it "is invalid without group_id" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it "is invalid without user_id" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end

  end
end
