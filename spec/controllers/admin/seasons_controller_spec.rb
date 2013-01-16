require 'spec_helper'

describe Admin::SeasonsController do

  describe "GET #index" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end

    it "assigns @seasons" do
      season = mock("season")
      Season.stubs(:all).returns([season])
      get :index
      assigns(:seasons).should eq([season])
    end

    # Creation of seasons happens on the index page, so we assign a new season here
    # instead of in a new action.
    it "assigns @season" do
      get :index
      assigns(:season).should be_a_new(Season)
    end
  end

  describe "POST #create" do
    let(:season) { season = stub_everything("season") }

    before do
      Season.stubs(:new).returns(season)
    end

    it "creates a new season" do
      Season.expects(:new).with("name" => "Season 1, 2012").returns(season)
      post :create, :season => { "name" => "Season 1, 2012" }
    end

    it "saves the season" do
      season.expects(:save)
      post :create
    end

    context "when the season saves successfully" do
      before do
        season.stubs(:save).returns(true)
      end

      it "has a successful flash notice" do
        post :create
        flash[:notice].should be
      end

      it "redirects to the season index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end

    context "when the season fails to save" do
      before do
        season.stubs(:save).returns(false)
      end

      it "assigns @season" do
        post :create
        assigns(:season).should eq(season)
      end

      it "re-renders the season index" do
        post :create
        response.should render_template("index")
      end
    end
  end

  describe "GET #edit" do
    it "finds the season" do
      season = mock("season")
      Season.stubs(:find).with("1").returns(season)
      Season.expects(:find).with("1").returns(season)
      get :edit, :id => "1"
    end
  end

  describe "PUT #update" do

  end

  describe "DELETE #destroy" do

    it "redirect to season index" do
      delete :destroy, :id => "1"
      response.should redirect_to(:action => "index")
    end

    it "delete the project" do
      season = mock("season")
      #Season.stubs(:find).returns(season)
      season.stubs(:destroy)
      season.expects(:destroy)
      delete :destroy, :id => season.id
    end
  end

end
