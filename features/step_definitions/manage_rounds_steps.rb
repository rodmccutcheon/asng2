### UTILITY METHODS ###
def add_round(name)
  click_link "Add Round"
  fill_in "Round Name", :with => name
  click_button "Save"
end

def edit_round(name)
  fill_in "Round Name", :with => name
  click_button "Save"
end

### GIVEN ###
Given /^a season exists$/ do
  @season = FactoryGirl.create(:season)
end

Given /^I am editing the season$/ do
  visit "/admin/seasons/#{@season.id}/edit"
end

### WHEN ###
When /^I add a round with a valid name to the season$/ do
  add_round("New Round")
end

When /^I add a round with an invalid name to the season$/ do
  add_round("")
end

When /^I edit a round wih a valid name$/ do
  @season.rounds.create(:name => "Old Round Name")
  visit "/admin/seasons/#{@season.id}/edit"
  edit_round("New Round Name")
end

When /^I edit a round with an invalid name$/ do
  @season.rounds.create(:name => "Old Round Name")
  visit "/admin/seasons/#{@season.id}/edit"
  edit_round("")
end

When /^I delete a round$/ do
  @season.rounds.create(:name => "Old Round Name")
  visit "/admin/seasons/#{@season.id}/edit"
  click_link "Remove"
  click_button "Save"
end

### THEN ###
Then /^I should see the season now has a round$/ do
  within("td#num_rounds") do
    page.should have_content "1"
  end
end

Then /^I should see an invalid round message$/ do
  page.should have_content "Round name can't be blank"
end

Then /^I should see the new name reflected$/ do
  visit "/admin/seasons/#{@season.id}/edit"
  find_field('Round Name').value.should == "New Round Name"
end

Then /^I should no longer see the round listed$/ do
  visit "/admin/seasons"
  within("td#num_rounds") do
    page.should have_content "0"
  end
end