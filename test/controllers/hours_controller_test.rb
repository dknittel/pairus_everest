require 'test_helper'

class HoursControllerTest < ActionController::TestCase

describe "hours_controller" do
  describe "GET /hours" do
    it "renders a successful status" do
      # arrange
      # act
      get '/hours'
      # assert
      expect(last_response.status).to eq(200)
    end

    it "renders list of hours in schedule" do
      # arrange
      Hour.create(start: Time.now)
      # act
      get '/hours'
      # assert
      expect(last_response.body.created_at.utc.to_s).to be_within(1.second).of Time.now
    end
  end

  describe "GET /hours/:id" do
    describe "if the hour exists" do
      it "renders a successful status" do
        # arrange
        @hour = Hour.create(start: Time.now)
        # act
        get "/hours/#{@hour.id}"
        # assert
        expect(last_response.status).to eq(200)
      end
    end

  end

  describe "POST /hours" do
    it "renders a successful status" do
      # arrange
      Hour.create(start: Time.now)
      # act
      post "/hours"
      # assert
      expect(last_response.status).to eq(200)
    end

    it "increases the number of available hours" do
      # arrange
      Hour.create(start: Time.now)
      # act
      post '/hours'
      # assert
      expect {
       post "/hours", start: Time.now
        }.to change { Hour.count }
    end

  describe "POST /hours" do
    it "create a new available hour" do
      Hour.delete_all

      expect {
        post "/hours", start: Time.now
      }.to change { Hour.count }
    end
  end

  describe "UPDATE /hours/:id" do
    it "renders a successful status" do
      # arrange
      # act
      update "/hours/#{@hour.id}"
      # assert
      expect(last_response.status).to eq(200)
    end

    it "updates individual hour record" do
      # arrange
      Hour.update(start: Time.now)
      # act
      update "/hours/#{@hour.id}"
      # assert
      expect(last_response.body.updated_at.utc.to_s).to be_within(1.second).of Time.now
    end
  end
end
