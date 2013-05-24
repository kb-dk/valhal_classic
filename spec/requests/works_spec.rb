require 'spec_helper'

describe "Works" do
  before(:each) do
    visit 'http://localhost:3000/users/sign_in?locale=en'
    fill_in 'Username', :with => CONFIG[:test][:user]
    fill_in 'Password', :with => CONFIG[:test][:password]
    click_button 'Login'
  end

  describe "Create works" do
    before (:each) do
      visit new_person_url
      fill_in "person_firstname", :with => "FNPerson"
      fill_in "person_lastname", :with => "LNPerson"
      click_button "Create"
    end

    it "Create works" do
      visit new_work_url
      fill_in  "work_title", :with => "my work"
      click_button "Create"
    end

    it "Create work with Author" do
      visit new_work_url
      fill_in  "work_title", :with => "my work"
      select  "LNPerson, FNPerson", :from => "person_id"
      click_button "Create"
      page.should have_content("Work was successfully created.")
      page.should have_content("FNPerson LNPerson")
    end

  end

  after(:all) do
    Person.all.each { |person| person.delete }
    Work.all.each { |work| work.delete }
  end
end
