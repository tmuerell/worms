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

describe AttendancesController do
  include Devise::TestHelpers

  before(:each) do 
    @user = Factory.create(:user, :role => 'admin')
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # Attendance. As you add validations to Attendance, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    Factory.build(:attendance).attributes.symbolize_keys
  end

  describe "GET index" do
    it "assigns all attendances as @attendances" do
      attendance = Attendance.create! valid_attributes
      get :index
      assigns(:attendances).should eq([attendance])
    end
  end

  describe "GET show" do
    it "assigns the requested attendance as @attendance" do
      attendance = Attendance.create! valid_attributes
      get :show, :id => attendance.id.to_s
      assigns(:attendance).should eq(attendance)
    end
  end

  describe "GET new" do
    it "assigns a new attendance as @attendance" do
      get :new
      assigns(:attendance).should be_a_new(Attendance)
    end
  end

  describe "GET edit" do
    it "assigns the requested attendance as @attendance" do
      attendance = Attendance.create! valid_attributes
      get :edit, :id => attendance.id.to_s
      assigns(:attendance).should eq(attendance)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Attendance" do
        expect {
          post :create, :attendance => valid_attributes
        }.to change(Attendance, :count).by(1)
      end

      it "assigns a newly created attendance as @attendance" do
        post :create, :attendance => valid_attributes
        assigns(:attendance).should be_a(Attendance)
        assigns(:attendance).should be_persisted
      end

      it "redirects to the created attendance" do
        post :create, :attendance => valid_attributes
        response.should redirect_to(Attendance.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved attendance as @attendance" do
        # Trigger the behavior that occurs when invalid params are submitted
        Attendance.any_instance.stub(:save).and_return(false)
        post :create, :attendance => {}
        assigns(:attendance).should be_a_new(Attendance)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Attendance.any_instance.stub(:save).and_return(false)
        post :create, :attendance => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested attendance" do
        attendance = Attendance.create! valid_attributes
        # Assuming there are no other attendances in the database, this
        # specifies that the Attendance created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Attendance.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => attendance.id, :attendance => {'these' => 'params'}
      end

      it "assigns the requested attendance as @attendance" do
        attendance = Attendance.create! valid_attributes
        put :update, :id => attendance.id, :attendance => valid_attributes
        assigns(:attendance).should eq(attendance)
      end

      it "redirects to the attendance" do
        attendance = Attendance.create! valid_attributes
        put :update, :id => attendance.id, :attendance => valid_attributes
        response.should redirect_to(attendance)
      end
    end

    describe "with invalid params" do
      it "assigns the attendance as @attendance" do
        attendance = Attendance.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Attendance.any_instance.stub(:save).and_return(false)
        put :update, :id => attendance.id.to_s, :attendance => {}
        assigns(:attendance).should eq(attendance)
      end

      it "re-renders the 'edit' template" do
        attendance = Attendance.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Attendance.any_instance.stub(:save).and_return(false)
        put :update, :id => attendance.id.to_s, :attendance => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested attendance" do
      attendance = Attendance.create! valid_attributes
      expect {
        delete :destroy, :id => attendance.id.to_s
      }.to change(Attendance, :count).by(-1)
    end

    it "redirects to the attendances list" do
      attendance = Attendance.create! valid_attributes
      delete :destroy, :id => attendance.id.to_s
      response.should redirect_to(attendances_url)
    end
  end

end
