Feature: content of merged articles

  As a shared blogger
  So that I can merge articles with similar topics/views
  I want to merge the articles in question

Background: articles ready to be merged

  Given the following articles exist:
    | title     | author  | body  |
    | Article A | AuthorA | BodyA |
    | Article B | AuthorB | BodyB |
    
  And I am on the edit page for "Article A"
  And the current user is "admin"
  When I fill in "Merge Article With" with "2"
  And I follow "Merge With This Article"
  Then I should be on the view page for "Article A + Article B"
    ## Not sure how we plan to create a new title for merged articles
    
Scenario: the text of the articles are in the merged article
  When I am on the view page for "Article A + Article B"
  Then I should see the text of "Article A"
  And I should see the text of "Article B"
  
Scenario: the authors of the articles are in the merged article
  When I am on the content page
  Then I should see "AuthorA"
    ## I don't think we can say 'see the author of "Article B"' because "Article B" has been destroyed
  And I should see "AuthorB"