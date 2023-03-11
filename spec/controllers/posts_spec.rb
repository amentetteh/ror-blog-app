require_relative '../rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET #index' do
    before(:example) { get user_posts_path(user_id: 10) }

    it 'returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_post_path(user_id: 10, id: 10) }

    it 'returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Post')
    end
  end
end
