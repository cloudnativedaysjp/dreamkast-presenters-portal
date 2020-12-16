require 'rails_helper'

describe SpeakersController, type: :request do
  describe "GET /ev001/speakers/:id" do
    before do
      create(:event_001)
    end

    describe 'not logged in' do
      it "redirect to event top page" do
        get '/ev001/speakers/1'
        expect(response).to_not be_successful
        expect(response).to have_http_status '302'
        expect(response).to redirect_to '/auth/auth0'
      end
    end

    describe 'logged in' do
      subject(:user_session) { {userinfo: {info: {email: "foo@example.com"}, extra: {raw_info: {sub: "mock", "https://cloudnativedays.jp/roles" => ""}}}}}

      before do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_session)
      end

      describe 'not registered' do
        it "redirect to registration page" do
          get '/ev001/speakers/1'
          expect(response).to_not be_successful
          expect(response).to have_http_status '302'
          expect(response).to redirect_to '/ev001/registration'
        end
      end

      describe 'registered' do
        before do
          create(:alice)
        end

        it "show speaker page" do
          get '/ev001/speakers/1'
          expect(response).to be_successful
          expect(response).to have_http_status '200'
        end
      end
    end
  end
end
