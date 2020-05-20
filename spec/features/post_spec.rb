require 'rails_helper'

feature 'post', type: :feature do
  let(:user) { create(:user) }

  scenario 'ユーザー情報が更新されていること' do
    # ログイン前には投稿をするボタンがない
    visit root_path
    expect(page).to have_no_content('投稿をする')

    # ログインする
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('投稿をする')

    # メンター記事を投稿する
    expect do
      click_link('投稿をする')
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: 'フィーチャスペックのテスト'
      fill_in 'post_content', with: 'フィーチャスペックのテスト'
      fill_in 'post_fee', with: '1000円 / 月'
      find('input[type="submit"]').click
    end.to change(Post, :count).by(1)
  end
end
