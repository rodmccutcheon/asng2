
### WHEN ###
When /^I view the list of (.*)$/ do |items|
  visit "/admin/#{items}"
end
