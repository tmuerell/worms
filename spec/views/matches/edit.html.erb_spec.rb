require 'spec_helper'

describe "matches/edit.html.erb" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
      :league_id => 1,
      :created_by => 1
    ))
  end

  it "renders the edit match form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => matches_path(@match), :method => "post" do
      assert_select "input#match_league_id", :name => "match[league_id]"
      assert_select "input#match_created_by", :name => "match[created_by]"
    end
  end
end
