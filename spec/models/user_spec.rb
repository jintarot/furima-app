require 'rails_helper'

RSpec.describe User, type: :model do
 describe "ユーザー新規登録" do
  it "nicknameが空であれば登録できない" do
    user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",first_name:"田中",last_name:"太郎")
    user.valid?
    expect(user.errors.full_messages).to include("ニックネームを入力してください")
  end
  it "emailがなければ新規登録できない" do
      user = User.new(nickname: "安倍", email: "", password: "00000000", password_confirmation: "00000000",first_name:"田中",last_name:"太郎")
      user.valid?
      expect(user.errors.full_messages).to include("Emailを入力してください")
  end
  it "last_nameがなければ、また正しい書式でなければ新規登録できない" do
    user = User.create(nickname: "安倍",email:"helloworld2020@google.com",password:"123456",password_confirmation:"123456",first_name:"田中",last_name:"")
    
  end
  it "first_nameがなければ、また正しい書式でなければ失敗する" do
  user = User.create(nickname: "安倍",email:"helloworld2020@google.com",password:"123456",password_confirmation:"123456",first_name:"田中",last_name:"")
  end
  end
  describe "ログイン" do
    it "誤りがあれば失敗する" do
      user = User.create(nickname: "安倍",email:"helloworld2020@google.com",password:"123456",password_confirmation:"123456",first_name:"田中",last_name:"")
    end
  
  end

end
