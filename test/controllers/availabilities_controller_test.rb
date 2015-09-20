require 'test_helper'

class AvailabilitiesControllerTest < ActionController::TestCase
  describe "availabilities_controller" do
    describe "GET /availabilities" do
      it "renders a successful status" do
        # arrange
        # act
        get '/availabilities'
        # assert
        expect(last_response.status).to eq(200)
      end

      it "renders list of availabilities" do
        # arrange
        Availability.create(taken: false)
        # act
        get '/availabilities'
        # assert
        expect(last_response.body).to include("true")
      end
    end

    describe "GET /availabilities/:id" do
      describe "if the availability exists" do
        it "renders a successful status" do
          # arrange
          @availability = Availability.create(taken: false)
          # act
          get "/availabilities/#{@availability.id}"
          # assert
          expect(last_response.status).to eq(200)
        end
      end
    end

    describe "POST /availabilities" do
      it "renders a successful status" do
        # arrange
        Availability.create(taken: false)
        # act
        post "/availabilities"
        # assert
        expect(last_response.status).to eq(200)
      end

      it "increases the number of availabilities" do
        # arrange
        Availability.create(taken: false)
        # act
        # assert
        expect {
          post "/availabilities", taken: false
        }.to change { Availability.count }
      end
    end

      describe "POST /availabilities" do
        it "not create new availability" do
          Availability.delete_all

          post '/availabilities'

          expect {
            post "/availabilities", taken: false
          }.not_to change { Availability.count }
        end
      end

      describe "UPDATE /availabilities/:id" do
        it "renders a successful status" do
          # arrange
          # act
          update "/availabilities/#{@availability.id}"
          # assert
          expect(last_response.status).to eq(200)
        end

        it "updates individual availability record" do
          # arrange
          @availability = Availability.update(taken: true)
          # act
          update "/availabilities/#{@availability.id}"
          # assert
          expect(last_response.body).to include("true")
        end
      end

      describe "selecting user_selected_topics changes number of availabilities" do
        it "pending further information" do
        end
      end
    end
