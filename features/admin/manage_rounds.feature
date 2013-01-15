Feature: Manage Rounds
  In order to add fixture information
  As an administrator
  I want to be able to manage Rounds

  Background:
    Given I am logged in as an admin user
    And a season exists
    And I am editing the season

  @javascript
  Scenario: Round is added successfully to season
    When I add a round with a valid name to the season
    Then I should see a season successfully edited message
    And I should see the season now has a round

  @javascript
  Scenario: Error adding round to season
    When I add a round with an invalid name to the season
    Then I should see an invalid round message

  Scenario: Round is edited successfully
    When I edit a round wih a valid name
    Then I should see a season successfully edited message
    And I should see the new name reflected

  Scenario: Error editing round
    When I edit a round with an invalid name
    Then I should see an invalid round message

  @javascript
  Scenario: Round destroyed
    When I delete a round
    Then I should no longer see the round listed
