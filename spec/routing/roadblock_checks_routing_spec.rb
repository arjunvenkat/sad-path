require "spec_helper"

describe RoadblockChecksController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/roadblock_checks").to route_to("roadblock_checks#index")
    end

    it "routes to #new" do
      expect(:get => "/roadblock_checks/new").to route_to("roadblock_checks#new")
    end

    it "routes to #show" do
      expect(:get => "/roadblock_checks/1").to route_to("roadblock_checks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/roadblock_checks/1/edit").to route_to("roadblock_checks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/roadblock_checks").to route_to("roadblock_checks#create")
    end

    it "routes to #update" do
      expect(:put => "/roadblock_checks/1").to route_to("roadblock_checks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/roadblock_checks/1").to route_to("roadblock_checks#destroy", :id => "1")
    end

  end
end
