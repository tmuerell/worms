require 'spec_helper'

describe "statistics/index.html.erb" do
  include Devise::TestHelpers

  it "renders an empty page if no league is present" do
    render
  end
  
  it "renders a version 1 league" do
    assign(:league, FactoryGirl.create(:league, :version => 1))
    render
  end
  
  it "renders a version 2 league" do
    assign(:league, FactoryGirl.create(:league, :version => 2))
    render
  end
end
