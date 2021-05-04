require 'rails_helper'

RSpec.describe User, type: :model do
      describe 'ユーザー新規登録' do
        it 'nicknameが空では登録できない' do
          user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
          user.valid?
          expect(user.errors.full_messages).to include("ニックネームを入力してください", "First nameを入力してください", "First nameis invalid. Input full-width characters.", "Last nameを入力してください", "Last nameis invalid. Input full-width characters.")
        end
      end
    end
    
    

