Feature: Manage Users
  As an admin
  I want the ability to manage users
  In order to control which users can access the website, and what features they may use

  Background:
    Given I am logged in as an admin user

  Scenario: View Users
    When I view the list of users
    Then I should see all users listed

  Scenario: Change User Role
    When I change a users role
    Then I should see an user successfully updated message

  Scenario: Delete User
    When I delete a user
    Then I should see an user successfully deleted message