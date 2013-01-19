require 'spec_helper'

describe Admin::TeamsController do
  let(:team) { team = mock("team") }

  describe "GET #index" do
    before(:each) do
      Team.stubs(:all).returns([team])
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should assign_to(:teams).with([team]) }
    it { should assign_to(:team) }
  end

  describe "POST #create" do
    before(:each) do
      Team.stubs(:new).returns(team)
      team.stubs(:save)
    end

    it "should assign @seasons" do
      Team.stubs(:all).returns([team])
      post :create
      should assign_to(:teams).with([team])
    end

    it "should create a new team" do
      Team.expects(:new).with("name" => "All Show No Go").returns(team)
      post :create, :team => { "name" => "All Show No Go" }
    end

    it "should save the team" do
      team.expects(:save)
      post :create
    end

    context "when the team saves successfully" do
      before(:each) do
        team.stubs(:save).returns(true)
        post :create
      end

      it { should set_the_flash }
      it { should redirect_to(:action => "index") }
    end

    context "when the team fails to save" do
      before(:each) do
        team.stubs(:save).returns(false)
        post :create
      end

      it { should assign_to(:team).with(team) }
      it { should render_template(:index)}
    end
  end

end