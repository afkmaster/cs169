Feature: permissions of merged articles

  As an author of a merged article
  So that I can collaborate easily with other authors
  I want to be able to make changes to merged articles

Background: merged article exists

  Given the following articles exist:
    | title       | author            |
    | Article AB  | authorA, authorB  |

  When I am on the content page

Scenario: an author can edit merged article
  When the current user is "authorA"
  And I follow "Article AB"
  Then I should be on the edit page for "Article AB"

Scenario: another author can edit the same merged article
  When the current user is "authorB"
  And I follow "Article AB"
  Then I should be on the edit page for "Article AB"