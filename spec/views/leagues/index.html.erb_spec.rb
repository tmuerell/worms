require 'spec_helper'

describe "leagues/index.html.erb" do
  before(:each) do
    assign(:leagues, [
      Factory.create(:league),
      Factory.create(:league)
    ])
  end

  it "renders a list of leagues" do
    render
  end
end
