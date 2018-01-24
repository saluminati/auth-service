require 'rails_helper'

RSpec.describe 'UsersApis', type: :request do
    before(:all) do
        @user = FactoryBot.create(:v1_user)
        @token = Knock::AuthToken.new(payload: { sub: @user.id }).token
    end

    describe 'POST /v1_signin' do
        it 'authenticates the user and returns a JWT AuthToken' do
            post v1_signin_path, params: {
                auth: { email: @user.email, password: @user.password }
            }
            expect(response).to have_http_status(201)
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
end
