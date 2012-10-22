Feature: comments of merged articles

  As a contributor to a merged article
  So that I can keep track of my contributions
  I want to see my comments on merged articles

Background: articles and comments ready to be merged

  Given the following articles exist:
    | title     | 
    | Article A |
    | Article B |

  Given the following comments exist:
    | title       | article_id  | body    |
    | Comment A1  | 1           | BodyA1  |
    | Comment A2  | 1           | BodyA2  |
    | Comment B1  | 2           | BodyB1  |


Scenario: comments point to merged article
  When I am on the edit page for "Article A"
  And the current user is "admin"
  Then I should see "Merge With This Article"
  When I fill in "Merge Article With" with "2"
  And I follow "Merge With This Article"
  Then I should be on the view page for "Article A + Article B"
  Then I should see the body of "Comment A1"
  And I should see the body of "Comment A2"
  And I should see the body of "Comment B1"