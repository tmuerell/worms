require 'spec_helper'

describe "attendances/edit.html.erb" do
  before(:each) do
    @attendance = assign(:attendance, stub_model(Attendance,
      :match_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit attendance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attendances_path(@attendance), :method => "post" do
      assert_select "select#attendance_match_id", :name => "attendance[match_id]"
      assert_select "select#attendance_user_id", :name => "attendance[user_id]"
    end
  end
end
