Feature: Manage Teams
  In order to add fixture information
  As an administrator
  I want to be able to manage Teams

  Background:
    Given I am logged in as an admin user

  Scenario: Teams listed
    Given multiple teams exist
    When I view the list of teams
    Then I should see all teams listed

  Scenario: No teams listed
    Given no teams exist
    When I view the list of teams
    Then I should see a no teams found message

  Scenario: Team is created successfully
    When I create a team with a valid name
    Then I should see a team successfully created message