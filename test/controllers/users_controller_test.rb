class UsersControllerTest < ActionController::TestCase

  describe "users_controller" do
    describe "GET /users" do
      it "renders a successful status" do
        # arrange
        # act
        get "/users"
        # assert
        expect(last_response.status).to eq(200)
      end

      it "renders list of users user" do
        # arrange
        User.create(handle: "forest", email: "test@test.com", password: "hotelw2015", zipcode: "94010" )
        # act
        get "/users"
        # assert
        expect(last_response.body).to include("forest")
      end
    end

    describe "GET /users/:id" do
      describe "if the user exists" do
        it "renders a successful status" do
          # arrange
          @user = User.create(handle: "forest", email: "test@test.com", password: "", zipcode: "94010" )
          # act
          get "/users/#{@user.id}"
          # assert
          expect(last_response.status).to eq(200)
        end
      end
    end

    describe "POST /users" do
      it "create a new user" do
        User.delete_all

        expect {
          post "/users", handle: "forest"
        }.to change { User.count }
      end
    end
end