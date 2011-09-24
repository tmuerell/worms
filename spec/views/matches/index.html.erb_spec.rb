require 'spec_helper'

describe "matches/index.html.erb" do
  before(:each) do
    assign(:matches, [
      stub_model(Match,
        :league_id => 1,
        :created_by => 1
      ),
      stub_model(Match,
        :league_id => 1,
        :created_by => 1
      )
    ])
  end

  it "renders a list of matches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
