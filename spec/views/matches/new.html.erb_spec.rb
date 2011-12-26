require 'spec_helper'

describe "matches/new.html.erb" do
  before(:each) do
    assign(:match, stub_model(Match,
      :league_id => 1,
      :created_by => 1
    ).as_new_record)
  end

  it "renders new match form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => matches_path, :method => "post" do
      assert_select "select#match_league_id", :name => "match[league_id]"
    end
  end
end
