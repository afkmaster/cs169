Given /^the following articles exist:$/ do |table|
	articles_table.hashes.each do |article|
		Article.create!(article)
	end
end

Given /^the following comments exist:$/ do |table|
  	articles_table.hashes.each do |article|
		Article.create!(article)
	end
end

When /^the current user is "(.*?)"$/ do |arg1|
   
end

Then /^I should see the body of "(.*?)"$/ do |arg1|
   # express the regexp above with the code you wish you had
end

Given /^the current user is "(.*?)"$/ do |arg1|
   # express the regexp above with the code you wish you had
end

Then /^I should see the text of "(.*?)"$/ do |arg1|
   # express the regexp above with the code you wish you had
end

When /^the current user is not "(.*?)"$/ do |arg1|
   # express the regexp above with the code you wish you had
end
