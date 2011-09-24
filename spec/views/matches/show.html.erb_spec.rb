require 'spec_helper'

describe "matches/show.html.erb" do
  before(:each) do
    @match = assign(:match, stub_model(Match,
      :league_id => 1,
      :created_by => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
