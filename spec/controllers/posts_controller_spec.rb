require 'rails_helper'

describe PostsController, type: :controller do

  let(:post_bot) { create(:post) }
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
        login user
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
      it "ユーザー登録へ" do
        expect(response).to redirect_to(new_user_registration_path)
      end  
    end
  end

  describe 'GET #edit' do
    context "ログイン済み" do
      before do
        login user
      end
      it "@a_postが期待される値を持つ" do
        get :edit, params: { id: post_bot }
        expect(assigns(:a_post)).to eq post_bot
      end
      it "投稿編集ページへの遷移" do
        get :edit, params: { id: post_bot }
        expect(response).to render_template :edit
      end
    end

    context "未ログイン" do
      before do
        get :edit, params: { id: post_bot }
      end 
      it "ユーザー登録へ" do
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end

  describe 'GET #show' do
    context "ログイン済み" do
      before do
        login user
      end
      it "@a_postが期待される値を持つ" do
        get :show, params: { id: post_bot }
        expect(assigns(:a_post)).to eq post_bot
      end
      it "投稿詳細ページへの遷移" do
        get :show, params: { id: post_bot }
        expect(response).to render_template :show
      end
    end
    context "未ログイン" do
      before do
        get :show, params: { id: post_bot }
      end
      it "ユーザー登録へ" do
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end

  describe 'POST #create' do
    context "ログイン済み" do
      before do
        login user
      end

      it "データベースへ保存できているか" do
        expect do
          post :create, params: { user_id: user, post: attributes_for(:post) }
        end.to change(Post, :count).by(1)
      end

      it "保存成功後のリダイレクト" do
        post :create, params: { user_id: user, post: attributes_for(:post) }
        expect(response).to redirect_to ("http://test.host/posts/1")
      end

      it "データベースへ保存できていないか" do
        expect do
          post :create, params: { user_id: user, post: attributes_for(:post, title: nil) }
          expect(response).to change(Post, :count).by(0)
        end
      end

      it "保存失敗後のリダイレクト" do
        build_post = build(:post, title: "")
        post :create, params: { user_id: user, post: attributes_for(build_post) }
        expect(response).to redirect_to(new_post_path)
      end
    end

    context "未ログイン" do
      before do
        post :create, params: { post: attributes_for(:post) }
      end
      it "ユーザー登録へ" do
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end
end