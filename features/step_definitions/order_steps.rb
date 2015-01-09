#scenario1 navigate to order online page
Given(/^I am on the Dominos site/) do
  visit 'https://order.dominos.com/en/'
end
When(/^the homepage loads/) do
    expect(page).to have_selector(:id, 'homePage')
    #expect(page).to have_selector(:id, 'Dominos-HomePage')
end
And(/^I click order online link/) do
    click_link('Order Online')
end
Then (/^the order page displays/) do
    expect(page).to have_content("Is this order for delivery or carryout?")
end


#scenario2 select carryout and enter address
Given (/^I am on the Order Online page$/) do
  visit 'https://order.dominos.com/en/pages/order/#/locations/search/'
end
And (/^the delivery option is selected$/) do
  expect(page).to have_css('.Delivery.active')
  expect(page).to have_css('.Carryout')
  expect(page).to have_css('.Locations')
end
When(/^I click carryout button$/) do
  #require "debug"
  find('.Carryout').click
end
Then(/^the carryout option is selected$/) do
  expect(page).to have_no_css('.Delivery.active')
  expect(page).to have_css('.Carryout.active')
end
When(/^I enter a city$/) do
  #require "debug"
  fill_in('City', :with => 'Prairieville')
end

When(/^I select a state$/) do
  select('LA', :from => 'Region')
end

When(/^I enter a zip code$/) do
  fill_in('Postal_Code', :with => 70769)
end

When(/^I click Continue$/) do
  click_button('Continue')
end

Then(/^nearby dominos locations display$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can click the button to order carryout$/) do
  #expect(page).to have_css('.Based-On')
  find('.based-on', :with => 'Nearby for Carryout / Pickup').visible?
end


#scenario4
Given(/^I have selected a carry out location$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I choose popular items$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select a pizza$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the cart is updated$/) do
  pending # express the regexp above with the code you wish you had
end
