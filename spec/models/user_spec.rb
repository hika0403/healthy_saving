require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての入力があれば登録できること' do
        expect(@user).to be_valid
      end
      it 'family_nameが全角ひらがなであれば登録できること' do
        @user.family_name = 'たなか'
        @user.save
        expect(@user).to be_valid
      end
      it 'family_nameが全角カタカナであれば登録できること' do
        @user.family_name = 'タナカ'
        @user.save
        expect(@user).to be_valid
      end
      it 'family_nameが漢字であれば登録できること' do
        @user.family_name = '田中'
        @user.save
        expect(@user).to be_valid
      end
      it 'given_nameが全角ひらがなであれば登録できること' do
        @user.given_name = 'たろう'
        @user.save
        expect(@user).to be_valid
      end
      it 'given_nameが全角カタカナであれば登録できること' do
        @user.given_name = 'タロウ'
        @user.save
        expect(@user).to be_valid
      end
      it 'given_nameが漢字であれば登録できること' do
        @user.given_name = '太郎'
        @user.save
        expect(@user).to be_valid
      end
      it 'passwordが8文字以上であれば登録できること' do
        @user.password = 'abc123DD'
        @user.password_confirmation = 'abc123DD'
        @user.save
        expect(@user).to be_valid
      end
      it 'passwordが半角英小文字大文字数字が混合していれば登録できること' do
        @user.password = 'abc123DD'
        @user.password_confirmation = 'abc123DD'
        @user.save
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'family_nameがない場合は登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字を入力してください", "苗字全角文字を使用してください"
      end
      it 'family_nameが全角ひらがな、全角カタカナ、漢字以外場合は登録できないこと' do
        @user.family_name = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字全角文字を使用してください"
      end
      it 'given_nameがない場合は登録できないこと' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it 'given_nameが全角ひらがな、全角カタカナ、漢字以外場合は登録できないこと' do
        @user.given_name = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前全角文字を使用してください"
      end
      it 'emailがない場合は登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it '重複したemailは登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "メールアドレスはすでに存在します"
      end
      it 'emailに＠がない場合は登録できないこと' do
        @user.email = 'aaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end
      it 'passwordがない場合は登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordが7文字以下の場合は登録できないこと' do
        @user.password = 'Abc1234'
        @user.password_confirmation = 'Abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは8文字以上で入力してください", "パスワードは不正な値です"
      end
      it 'passwordが21文字以上の場合は登録できないこと' do
        @user.password = 'Abcdefghigklm1234567890'
        @user.password_confirmation = 'Abcdefghigklm1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは20文字以内で入力してください", "パスワードは不正な値です"
      end
      it 'passwordが半角英小文字大文字数字混合でない場合は登録できないこと' do
        @user.password = 'abcabcabc'
        @user.password_confirmation = 'abcabcabc'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '123456789'
        @user.password_confirmation = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it 'passwordが半角英小文字のみでは登録できないこと' do
        @user.password = 'abcdefghi'
        @user.password_confirmation = 'abcdefghi'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it 'passwordが半角英大文字のみでは登録できないこと' do
        @user.password = 'ABCDEFGHI'
        @user.password_confirmation = 'ABCDEFGHI'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it 'passwordが確認用を含めて二回入力していない場合は登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmationとパスワードの入力が一致しません"
      end
      it 'passwordとpassword_confirmationの値が一致していない場合は登録できないこと' do
        @user.password = 'abc123ABC'
        @user.password_confirmation = 'aaa123AAA'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmationとパスワードの入力が一致しません"
      end
      it 'nicknameがない場合は登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'birth_dayがない場合は登録できないこと' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "誕生日を入力してください"
      end
    end
  end
end
