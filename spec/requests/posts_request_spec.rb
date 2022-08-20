require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'Is a sucess' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before(:example) { get('/users/') }
    it 'Is a sucess' do
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("User pages")
    end
  end
end
