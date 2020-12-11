require 'rails_helper'

describe HomeController, type: :request do
  describe "GET event#show" do
    before do
      create(:event_001)
    end

    describe 'not logged in' do
      it "returns a success response with event top page" do
        get '/'
        expect(response).to be_successful
        expect(response).to have_http_status '200'
        expect(response.body).to include 'Event 001'
      end
    end
  end
end