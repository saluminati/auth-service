require 'rails_helper'

RSpec.describe 'UsersApis', type: :request do
    before(:all) do
        @user = FactoryBot.create(:v1_user)
        @token = Knock::AuthToken.new(payload: { sub: @user.id }).token
    end

    describe 'POST /v1_signin' do

        it 'authenticates the user and returns a JWT token' do
            post v1_signin_path, params: {
                auth: { email: @user.email, password: @user.password }
            }
            json = JSON.parse(response.body)
            expect(response).to have_http_status(201)
            expect(json['jwt']).to eq @token
        end
    end

    it 'returns 404 status when wrong credentials are provided' do
        post v1_signin_path, params: {
            auth: { email: 'some_other_email@email.com', password: 'somerandompassword' }
        }
        expect(response).to have_http_status(404)
    end

    it 'should raise ParameterMissing if the params are not provided' do
        expect do
            post v1_signin_path, params: {
                auth: {}
            }
        end.to raise_error ActionController::ParameterMissing
    end

    describe "POST /v1_identify" do

    it "validates the user identity and returns JSON object contains user id" do
      post v1_identify_path, headers: {
        'Authorization': "Bearer #{@token}"
      }
      expect(response).to have_http_status(200)
    end

    it "return 401 (unautherzied) status when invalid token is provided" do
      post v1_identify_path, headers: {
        'Authorization': "Bearer #{Faker::Lorem.sentence(10)}"
      }
      expect(response).to have_http_status(401)
    end

  end

end
