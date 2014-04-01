require "spec_helper"

describe CheckListItemsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/check_list_items").to route_to("check_list_items#index")
    end

    it "routes to #new" do
      expect(:get => "/check_list_items/new").to route_to("check_list_items#new")
    end

    it "routes to #show" do
      expect(:get => "/check_list_items/1").to route_to("check_list_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/check_list_items/1/edit").to route_to("check_list_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/check_list_items").to route_to("check_list_items#create")
    end

    it "routes to #update" do
      expect(:put => "/check_list_items/1").to route_to("check_list_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/check_list_items/1").to route_to("check_list_items#destroy", :id => "1")
    end

  end
end
