Feature: Manage Seasons
  In order to add fixture information
  As an administrator
  I want to be able to manage Seasons

  Background:
    Given I am logged in as an admin user

  Scenario: Seasons listed
    Given multiple seasons exist
    When I view the list of seasons
    Then I should see all seasons listed

  Scenario: No seasons listed
    Given no seasons exist
    When I view the list of seasons
    Then I should see a no seasons found message

  Scenario: Season is created successfully
    When I create a season with a valid name
    Then I should see a season successfully created message

  Scenario: Error creating season
    When I create a season with an invalid name
    Then I should see an invalid season message

  Scenario: Seasons is edited successfully
    When I edit a season wih a valid name
    Then I should see a season successfully edited message
    And I should see the new season name reflected

  Scenario: Error editing season
    When I edit a season with an invalid name
    Then I should see an invalid season message

  Scenario: Season destroyed
    When I delete a season
    Then I should no longer see the season listed