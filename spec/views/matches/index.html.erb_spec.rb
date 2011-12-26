require 'spec_helper'

describe "matches/index.html.erb" do
  before(:each) do
    assign(:matches, [
    Factory.create(:match),
    Factory.create(:match)
    ])
  end

  it "renders a list of matches" do
    render
  end
end
