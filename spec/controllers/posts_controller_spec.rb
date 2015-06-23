require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do
  describe '#index' do
    let!(:post) { FactoryGirl.create :post, title: 'First post' }

    context 'without params' do
      let(:json) { { total_entries: Post.count, page: 1, per_page: 3, posts: [post] }.to_json }
      before { get :index }
      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(json) }
    end
  end

  describe '#show' do
    let!(:post) { FactoryGirl.create :post, title: 'First post' }
    let(:json)  { post.to_json }

    context 'exist post' do
      before { get :show, { id: post.id } }
      it { expect(response.body).to eq(json) }
    end

    context 'not exist post' do
      before { get :show, { id: post.id + 1 } }
      it { expect(response).to have_http_status(404) }
    end
  end

  describe '#create' do
    let(:user) { FactoryGirl.create :user }
    let(:mock) { FactoryGirl.build :post, user: user }

    context 'when user signed in' do
      before { sign_in user }

      it 'should be change posts count' do
        expect{ post :create, post: mock.attributes }.to change(Post, :count)
      end
    end

    context 'when user did not sign in' do
      it 'should be change posts count' do
        expect{ post :create, post: mock.attributes }.not_to change(Post, :count)
      end
    end
  end
end
