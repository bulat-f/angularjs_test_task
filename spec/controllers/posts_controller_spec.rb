require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do
  describe '#index' do
    let!(:posts)     { FactoryGirl.create_list :post, 3 }
    let!(:last_post) { FactoryGirl.create :post, title: 'Last post' }

    context 'without params' do
      let(:json) { { total_entries: Post.count, page: 1, per_page: 3, posts: posts }.to_json }
      before { get :index }
      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(json) }
    end

    context 'with params' do
      context 'search' do
        context 'when found' do
          let(:json) { { total_entries: Post.count, page: 1, per_page: 3, posts: [last_post] }.to_json }
          before { get :index, search: 'Last' }
          it { expect(response).to have_http_status(:ok) }
          it { expect(response.body).to eq(json) }
        end

        context 'when not found' do
          let(:json) { { total_entries: Post.count, page: 1, per_page: 3, posts: [] }.to_json }
          before { get :index, search: 'Not exist post' }
          it { expect(response).to have_http_status(:ok) }
          it { expect(response.body).to eq(json) }
        end
      end

      context 'page' do
        context 'when page exist' do
          let!(:newest_post) { FactoryGirl.create :post }
          let(:json) { { total_entries: Post.count, page: 2, per_page: 3, posts: [last_post, newest_post] }.to_json }
          before { get :index, page: 2 }
          it { expect(response).to have_http_status(:ok) }
          it { expect(response.body).to eq(json) }
        end

         context 'when page not exist' do
          let!(:newest_post) { FactoryGirl.create :post }
          let(:json) { { total_entries: Post.count, page: 3, per_page: 3, posts: [] }.to_json }
          before { get :index, page: 3 }
          it { expect(response).to have_http_status(:ok) }
          it { expect(response.body).to eq(json) }
        end
      end
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
      it { expect(response).to have_http_status(:not_found) }
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
      it 'should not be change posts count' do
        expect{ post :create, post: mock.attributes }.not_to change(Post, :count)
      end
    end

    context 'when fields are valid' do
      let(:valid_mock) { FactoryGirl.build :post, user: user }

      before do
        sign_in user
      end

      it 'should create post' do
        expect{ post :create, post: valid_mock.attributes }.to change(Post, :count)
        expect(response).to have_http_status(:created)
      end
    end

    context 'when fields are invalid' do
      let(:invalid_mock) { FactoryGirl.build :post, title: '', body: 'Invalid post body', user: user }

      before do
        sign_in user
        post :create, post: invalid_mock.attributes
      end

      it 'should not create post' do
        expect{ post :create, post: invalid_mock.attributes }.not_to change(Post, :count)
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
