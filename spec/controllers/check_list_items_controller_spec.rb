require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CheckListItemsController do

  # This should return the minimal set of attributes required to create a valid
  # CheckListItem. As you add validations to CheckListItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "check_list_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CheckListItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all check_list_items as @check_list_items" do
      check_list_item = CheckListItem.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:check_list_items)).to eq([check_list_item])
    end
  end

  describe "GET show" do
    it "assigns the requested check_list_item as @check_list_item" do
      check_list_item = CheckListItem.create! valid_attributes
      get :show, {:id => check_list_item.to_param}, valid_session
      expect(assigns(:check_list_item)).to eq(check_list_item)
    end
  end

  describe "GET new" do
    it "assigns a new check_list_item as @check_list_item" do
      get :new, {}, valid_session
      expect(assigns(:check_list_item)).to be_a_new(CheckListItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested check_list_item as @check_list_item" do
      check_list_item = CheckListItem.create! valid_attributes
      get :edit, {:id => check_list_item.to_param}, valid_session
      expect(assigns(:check_list_item)).to eq(check_list_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CheckListItem" do
        expect {
          post :create, {:check_list_item => valid_attributes}, valid_session
        }.to change(CheckListItem, :count).by(1)
      end

      it "assigns a newly created check_list_item as @check_list_item" do
        post :create, {:check_list_item => valid_attributes}, valid_session
        expect(assigns(:check_list_item)).to be_a(CheckListItem)
        expect(assigns(:check_list_item)).to be_persisted
      end

      it "redirects to the created check_list_item" do
        post :create, {:check_list_item => valid_attributes}, valid_session
        expect(response).to redirect_to(CheckListItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved check_list_item as @check_list_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(CheckListItem).to receive(:save).and_return(false)
        post :create, {:check_list_item => { "check_list_id" => "invalid value" }}, valid_session
        expect(assigns(:check_list_item)).to be_a_new(CheckListItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(CheckListItem).to receive(:save).and_return(false)
        post :create, {:check_list_item => { "check_list_id" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested check_list_item" do
        check_list_item = CheckListItem.create! valid_attributes
        # Assuming there are no other check_list_items in the database, this
        # specifies that the CheckListItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(CheckListItem).to receive(:update).with({ "check_list_id" => "1" })
        put :update, {:id => check_list_item.to_param, :check_list_item => { "check_list_id" => "1" }}, valid_session
      end

      it "assigns the requested check_list_item as @check_list_item" do
        check_list_item = CheckListItem.create! valid_attributes
        put :update, {:id => check_list_item.to_param, :check_list_item => valid_attributes}, valid_session
        expect(assigns(:check_list_item)).to eq(check_list_item)
      end

      it "redirects to the check_list_item" do
        check_list_item = CheckListItem.create! valid_attributes
        put :update, {:id => check_list_item.to_param, :check_list_item => valid_attributes}, valid_session
        expect(response).to redirect_to(check_list_item)
      end
    end

    describe "with invalid params" do
      it "assigns the check_list_item as @check_list_item" do
        check_list_item = CheckListItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(CheckListItem).to receive(:save).and_return(false)
        put :update, {:id => check_list_item.to_param, :check_list_item => { "check_list_id" => "invalid value" }}, valid_session
        expect(assigns(:check_list_item)).to eq(check_list_item)
      end

      it "re-renders the 'edit' template" do
        check_list_item = CheckListItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(CheckListItem).to receive(:save).and_return(false)
        put :update, {:id => check_list_item.to_param, :check_list_item => { "check_list_id" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested check_list_item" do
      check_list_item = CheckListItem.create! valid_attributes
      expect {
        delete :destroy, {:id => check_list_item.to_param}, valid_session
      }.to change(CheckListItem, :count).by(-1)
    end

    it "redirects to the check_list_items list" do
      check_list_item = CheckListItem.create! valid_attributes
      delete :destroy, {:id => check_list_item.to_param}, valid_session
      expect(response).to redirect_to(check_list_items_url)
    end
  end

end
