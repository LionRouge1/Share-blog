require 'rails_helper'

<<<<<<< HEAD
# RSpec.describe 'Users', type: :request do
# end
=======
RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'is a sucess' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end
end
>>>>>>> 17519aca2181ad41a1094a7d3c51060d2ec79e94
