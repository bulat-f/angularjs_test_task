require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do
  let!(:post) { FactoryGirl.create :post, title: 'First post' }
  describe '#index' do
    context 'without params' do
      let(:json) { { total_entries: Post.count, page: 1, per_page: 3, posts: [post] }.to_json }
      before { get :index }
      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(json) }
    end
  end
end
