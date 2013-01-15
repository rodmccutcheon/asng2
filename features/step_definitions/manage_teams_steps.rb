### UTILITY METHODS ###
def create_team(name)
  visit '/admin/teams'
  fill_in "Name", :with => name
  click_button "Add"
end

### GIVEN ###
Given /^multiple teams exist$/ do
  3.times do
    FactoryGirl.create(:team)
  end
end

Given /^no teams exist$/ do
  Team.destroy_all
end

### WHEN ###
When /^I create a team with a valid name$/ do
  create_team("New Team")
end

### THEN ###
Then /^I should see all teams listed$/ do
  teams = Team.all
  teams.each do |team|
    page.should have_content(team.name)
  end
end

Then /^I should see a no teams found message$/ do
  page.should have_content "No teams found."
end

Then /^I should see a team successfully created message$/ do
  page.should have_content "Team was successfully created."
end