### UTILITY METHODS ###
def create_season(name)
  visit '/admin/seasons'
  fill_in "Name", :with => name
  click_button "Add"
end

def edit_season(name)
  season = FactoryGirl.create(:season, :name => 'Edit Me Season')
  visit "/admin/seasons/#{season.id}/edit"
  fill_in "Name", :with => name
  click_button "Save"
end

### GIVEN ###
Given /^multiple seasons exist$/ do
  3.times do
    FactoryGirl.create(:season)
  end
end

Given /^no seasons exist$/ do
  Season.destroy_all
end

### WHEN ###
When /^I create a season with a valid name$/ do
  create_season("New Season")
end

When /^I create a season with an invalid name$/ do
  create_season("")
end

When /^I edit a season wih a valid name$/ do
  edit_season("New Name Season")
end

When /^I edit a season with an invalid name$/ do
  edit_season("")
end

When /^I delete a season$/ do
  @deleted_season = FactoryGirl.create(:season, :name => "Delete Me Season")
  @other_season = FactoryGirl.create(:season, :name => "Another")
  visit '/admin/seasons'
  within("tr#season_#{@deleted_season.id}") do
    click_link "Delete"
  end
end

### THEN ###
Then /^I should see a season successfully created message$/ do
  page.should have_content "Season was successfully created."
end

Then /^I should see an invalid season message$/ do
  page.should have_content "Please review the problems below:"
  page.should have_content "Name can't be blank"
end

Then /^I should see all seasons listed$/ do
  seasons = Season.all
  seasons.each do |season|
    page.should have_content season.name
  end
end

Then /^I should see a no seasons found message$/ do
  page.should have_content "No seasons found."
end

Then /^I should see a season successfully edited message$/ do
  page.should have_content "Season was successfully updated."
end

Then /^I should see the new season name reflected$/ do
  page.should have_content "New Name Season"
end

Then /^I should no longer see the season listed$/ do
  visit '/admin/seasons'
  page.should_not have_content @deleted_season.name
  page.should have_content @other_season.name
end
