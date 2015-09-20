require 'test_helper'

class PotentialPairingsControllerTest < ActionController::TestCase
describe "potential_pairings_controller" do
  describe "GET /potential_pairs" do
    it "renders a successful status" do
      # arrange
      # act
      get '/potential_pairs'
      # assert
      expect(last_response.status).to eq(200)
    end

    it "renders list of potential_pairs" do
      # arrange
      PotentialPair.create(user1_accepted: true)
      # act
      get '/potential_pairs'
      # assert
      expect(last_response.body).not_to include("false")
    end
  end

  describe "GET /potential_pairs/:id" do
    describe "if the potential_pair exists" do
      it "renders a successful status" do
        # arrange
        @potential_pair = PotentialPair.create(user1_accepted: true)
        # act
        get "/potential_pairs/#{@potential_pair.id}"
        # assert
        expect(last_response.status).to eq(200)
      end
    end
  end

  describe "POST /potential_pairs" do
    it "renders a successful status" do
      # arrange
      PotentialPair.create(user1_accepted: true)
      # act
      post "/potential_pairs"
      # assert
      expect(last_response.status).to eq(200)
    end

    it "increases the number of potential_pairs" do
      # arrange
      PotentialPair.create(user1_accepted: true)
      # act
      # assert
      expect {
       post "/potential_pairs", user1_accepted: true
        }.to change { PotentialPair.count }
    end

    describe "POST /potential_pairs" do
    it "not create new potential_pair" do
      PotentialPair.delete_all

      post '/potential_pairs'

      expect {
        post "/potential_pairs", user1_accepted: true
      }.not_to change { PotentialPair.count }
    end
  end

  describe "UPDATE /potential_pairs/:id" do
    it "renders a successful status" do
      # arrange
      # act
      update "/potential_pairs/#{@potential_pair.id}"
      # assert
      expect(last_response.status).to eq(200)
    end

    it "updates potential pair rejection" do
      # arrange
      @potential_pair = PotentialPair.update(user2_accepted: false)
      # act
      update "/potential_pairs/#{@potential_pair.id}"
      # assert
      expect(last_response.body.user2_accepted).to include("false")
    end

    it "updates potential pair acceptance" do
      # arrange
      @potential_pair = PotentialPair.update(user2_accepted: true)
      # act
      update "/potential_pairs/#{@potential_pair.id}"
      # assert
      expect(last_response.body.user2_accepted).to include("true")
    end
  end

  describe "confirmed potential pair changes number of availabilities" do
    it "is pending further information" do
    end
  end

end
