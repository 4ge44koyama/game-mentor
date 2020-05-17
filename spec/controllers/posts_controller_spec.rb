require 'rails_helper'

describe PostsController, type: :controller do

  describe 'GET #new' do
    it "new.html.erbに遷移すること" do
      get :new

    end
  end

end