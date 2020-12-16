require 'rails_helper'

describe EventController, type: :request do
  describe "GET event#show" do
    before do
      create(:event_001)
    end

    describe 'not logged in' do
      it "returns a success response with event top page" do
        get '/ev001'
        expect(response).to be_successful
        expect(response).to have_http_status '200'
      end
    end

    describe 'logged in' do
      describe 'not registered' do
        before do
          allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(userinfo: {info: {email: "foo@example.com"}})
        end

        it "redirect to /ev001/speakers/registration" do
          get '/ev001'
          expect(response).to_not be_successful
          expect(response).to have_http_status '302'
          expect(response).to redirect_to '/ev001/speakers/registration'
        end
      end

      describe 'registered' do
        before do
          allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(userinfo: {info: {email: "foo@example.com"}})
          create(:alice)
        end

        it "returns a success response with event top page" do
          get '/ev001'
          expect(response).to be_successful
          expect(response).to have_http_status '200'
        end
      end
    end
  end
end
