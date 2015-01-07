Feature: Order Pizza Online From Dominos

Scenario: Verify user can order online from Dominos homepage
  When I am on the Dominos site
  Then the homepage loads
  When I click order online link
  Then the order page displays

Scenario: Verify user can select delivery or carryout
  Given the delivery option is selected by default
  When I click carryout button
  Then the carryout option is selected


Scenario: Verify user can enter address and select a dominos location

Scenario: Verify user select order multiple pizzas

Scenario: Verify check out page loads
