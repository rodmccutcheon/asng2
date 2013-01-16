require 'spec_helper'

describe Admin::TeamsController do

  describe "GET #index" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end

    it "assigns @teams" do
      team = mock("team")
      Team.stubs(:all).returns([team])
      get :index
      assigns(:teams).should eq([team])
    end

    # Creation of teams happens on the index page, so we assign a new team here
    # instead of in a new action.
    it "assigns @team" do
      get :index
      assigns(:team).should be_a_new(Team)
    end
  end

  describe "POST #create" do
    let(:team) { team = stub_everything("team") }

    before do
      Team.stubs(:new).returns(team)
    end

    it "creates a new team" do
      Team.expects(:new).with("name" => "All Show No Go").returns(team)
      post :create, :team => { "name" => "All Show No Go" }
    end

    it "saves the team" do
      team.expects(:save)
      post :create
    end

    context "when the team saves successfully" do
      before do
        team.stubs(:save).returns(true)
      end

      it "has a successful flash notice" do
        post :create
        flash[:notice].should be
      end

      it "redirects to the team index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end

    context "when the team fails to save" do
      before do
        team.stubs(:save).returns(false)
      end

      it "assigns @team" do
        post :create
        assigns(:team).should eq(team)
      end

      it "re-renders the team index" do
        post :create
        response.should render_template("index")
      end
    end
  end

end