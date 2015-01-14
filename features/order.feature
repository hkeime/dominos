Feature: Order Pizza Online From Dominos

Scenario: Verify user can navigate to order page from homepage
  Given I am on the Dominos site
  When the homepage loads
  And I click order online link
  Then the order page displays

Scenario: Verify user can change order type from delivery to carryout
  Given I am on the Order Online page
  And the delivery option is selected
  When I click carryout button
  Then the carryout option is selected
  When I enter a city
  And I select a state
  And I enter a zip code
  And I click Continue
  Then nearby locations page displays
  And I can click the button to order carryout

Scenario: Verify user select order multiple pizzas
  Given I have selected a carry out location
  When I choose popular items
  And I select a pepperoni pizza
  And I select a veggie pizza
  Then the cart is updated
  And I can click checkout button

Scenario: Verify check out page loads
