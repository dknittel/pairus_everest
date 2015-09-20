require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  describe "topics_controller" do
    describe "GET /topics" do
      it "renders a successful status" do
        # arrange
        # act
        get '/topics'
        # assert
        expect(last_response.status).to eq(200)
      end

      it "renders list of topics" do
        # arrange
        Topic.create(title: "ReactJS")
        # act
        get '/topics'
        # assert
        expect(last_response.body).to include("ReactJS")
      end
    end

    describe "GET /topics/:id" do
      describe "if the topic exists" do
        it "renders a successful status" do
          # arrange
          @topic = Topic.create(title: "ReactJS")
          # act
          get "/topics/#{@topic.id}"
          # assert
          expect(last_response.status).to eq(200)
        end

        it "renders individual of topic" do
          # arrange
          @topic = Topic.create(title: "ReactJS")
          # act
          get "/topics/#{@topic.id}"
          # assert
        expect(last_response.body).to include("ReactJS")
        end
      end
    end

    describe "POST /topics" do
      it "create a new topic" do
        Topic.delete_all

        @topic = Topic.create(title: "ReactJS")

        expect {
          post "/topics", title: "ReactJS."
        }.to change { Topic.count }
      end
    end

    describe "DELETE /topics/delete" do
      it "create a new topic" do
        @topic = Topic.create(title: "Goodbye")

        expect {
          delete "/topics/delete", title: "ReactJS."
        }.to change { Topic.count }
      end
    end
end
