require 'spec_helper'

describe "attendances/index.html.erb" do
  before(:each) do
    assign(:attendances, [
      Factory.create(:attendance),
      Factory.create(:attendance)
    ])
  end

  it "renders a list of attendances" do
    render
  end
end
