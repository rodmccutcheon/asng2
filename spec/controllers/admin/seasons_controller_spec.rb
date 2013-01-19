require 'spec_helper'

describe Admin::SeasonsController do
  let(:season) { season = mock("season") }

  describe "GET #index" do
    before(:each) do
      Season.stubs(:all).returns([season])
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should assign_to(:seasons).with([season]) }
    it { should assign_to(:season) }
  end

  describe "POST #create" do
    before(:each) do
      Season.stubs(:new).returns(season)
      season.stubs(:save)
    end

    it "should assign @seasons" do
      Season.stubs(:all).returns([season])
      post :create
      should assign_to(:seasons).with([season])
    end

    it "should create a new season" do
      Season.expects(:new).with("name" => "Season 1, 2012").returns(season)
      post :create, :season => { "name" => "Season 1, 2012" }
    end

    it "should save the season" do
      season.expects(:save)
      post :create
    end

    context "when the season saves successfully" do
      before(:each) do
        season.stubs(:save).returns(true)
        post :create
      end

      it { should set_the_flash }
      it { should redirect_to(:action => "index") }
    end

    context "when the season fails to save" do
      before(:each) do
        season.stubs(:save).returns(false)
        post :create
      end

      it { should assign_to(:season).with(season) }
      it { should render_template(:index) }
    end
  end

  describe "GET #edit" do
    before(:each) do
      Season.stubs(:find).with("1").returns(season)
    end

    it "should find the season" do
      Season.expects(:find).with("1").returns(season)
      get :edit, :id => "1"
    end

    it "should render the edit template" do
      get :edit, :id => "1"
      response.should render_template("edit")
    end
  end

  describe "PUT #update" do
    before(:each) do
      Season.stubs(:find).with("1").returns(season)
      season.stubs(:update_attributes)
    end

    after(:each) do
      put :update, :id => "1"
    end

    it "should find the season" do
      Season.expects(:find).with("1").returns(season)
    end

    it "should update the season's attributes" do
      season.expects(:update_attributes)
    end

    context "when the season updates successfully" do
      before do
        season.stubs(:update_attributes).returns(true)
        put :update, :id => "1"
      end

      it { should set_the_flash }
      it { should redirect_to(:action => "index") }
    end

    context "when the season fails to update" do
      before(:each) do
        season.stubs(:update_attributes).returns(false)
        put :update, :id => "1"
      end

      it { should assign_to(:season).with(season) }
      it { should render_template(:edit) }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      Season.stubs(:find).with("1").returns(season)
      season.stubs(:destroy)
    end

    it "should delete the project" do
      season.expects(:destroy)
      delete :destroy, :id => "1"
    end

    it "should redirect to the index action" do
      delete :destroy, :id => "1"
      response.should redirect_to(:action => "index")
    end
  end

end
