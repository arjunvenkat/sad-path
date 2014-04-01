require "spec_helper"

describe CourseCheckListsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/course_check_lists").to route_to("course_check_lists#index")
    end

    it "routes to #new" do
      expect(:get => "/course_check_lists/new").to route_to("course_check_lists#new")
    end

    it "routes to #show" do
      expect(:get => "/course_check_lists/1").to route_to("course_check_lists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/course_check_lists/1/edit").to route_to("course_check_lists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/course_check_lists").to route_to("course_check_lists#create")
    end

    it "routes to #update" do
      expect(:put => "/course_check_lists/1").to route_to("course_check_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/course_check_lists/1").to route_to("course_check_lists#destroy", :id => "1")
    end

  end
end
