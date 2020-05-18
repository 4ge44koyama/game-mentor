require 'rails_helper'

describe PostsController, type: :controller do

  let(:post) { create(:post) }
  let(:user) { create(:user) }

  describe 'GET #index' do

    it "@postsに正しい値が入っている事" do
      posts = create_list(:post, 3)
      get :index
      expect(assigns(:posts)).to match(posts.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "投稿一覧ページへの遷移" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do

    context "ログイン済み" do
      before do
        sign_in user
      end
      it "新規投稿ページへの遷移" do
        get :new
        expect(response).to render_template :new
      end
    end

    context "未ログイン" do
      before do
        get :new
      end
      it "トップページへ" do
        expect(response).to redirect_to(new_user_registration_path)
      end  
    end

  end

  

end