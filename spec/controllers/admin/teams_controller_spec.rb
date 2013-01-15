require 'spec_helper'

describe Admin::TeamsController do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end

    it "assigns @teams" do
      team = stub_model(Team)
      Team.stub(:all) {[widget]}
      get :index
      assigns(:teams).should eq([team])
    end

    # Creation of teams happens on the index page, so we assign a new team here instead of in a new action
    it "assigns @team" do
      get :index
      assigns(:team).should be_a_new(Team)
    end
  end

  describe "POST 'create'" do
    let(:team) { mock_model(Team).as_null_object }

    before do
      Team.stub(:new).and_return(team)
    end

    it "creates a new team" do
      Team.should_receive(:new).
        with("name" => "All Show No Go").
        and_return(team)
      post :create, :team => { "name" => "All Show No Go" }
    end

    it "saves the message" do
      team.should_receive(:save)
      post :create
    end

    it "redirects to the Messages index" do
      post :create
      response.should redirect_to(:action => "index")
    end
  end

end