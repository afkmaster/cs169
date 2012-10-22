Feature: merge articles as an admin

  As a shared blogger
  So that I can merge articles with similar topics/views
  I want to merge the articles in question

Background: articles ready to be merged

  Given the following articles exist:
    | title     | 
    | Article A |
    | Article B |
  
Scenario: non-admin cannot merge articles:
  When I am on the view page for "Article A"
  And the current user is not "admin"
  Then I should not see "Merge With This Article"

Scenario: admin can merge articles
  When I am on the view page for "Article A"
  And the current user is "admin"
  Then I should see "Merge With This Article"