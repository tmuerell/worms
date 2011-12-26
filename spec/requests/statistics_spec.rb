# encoding: utf-8

require 'spec_helper'

describe "Statistics" do
  it "shows the currently active league" do  
    Factory.create(:league, :name => "Alte Liga")
    Factory.create(:league, :name => "Neue Liga", :current => true)
    visit root_path
    page.should_not have_content("Alte Liga")
    page.should have_content("Neue Liga")
  end  
end
