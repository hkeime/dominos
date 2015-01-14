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

Then(/^nearby locations page displays$/) do
  expect(page).to have_css('#locationsResultsPage')
end


And(/^I can click the button to order carryout$/) do
  #find(:xpath, "//div[@data-storeid='3031']/descendant::a[@data-type='Carryout’]").click #This returns syntax error
  within ("[data-storeid='3031']") do
  find('a.js-orderCarryoutNow.js-carryoutAvailable.btn.btn--block').click
  end
end


#scenario4
Given(/^I have selected a carry out location$/) do
  visit ('https://order.dominos.com/en/pages/order/#/locations/search/?type=Carryout&c=prairivelle%2C%20LA%2070769&s=&locationName=')
  within ("[data-storeid='3031']") do
    find('a.js-orderCarryoutNow.js-carryoutAvailable.btn.btn--block').click
  end

end

When(/^I choose popular items$/) do
  find('a.qa-PastPopular.grid').click
end

When(/^I select a pepperoni pizza$/) do
  find('a[href="#/order/variant/new?code=14SCREEN&toppings=P:1/1;1|X:1/1;1|C:1/1;1"]').click
end
And(/^I select a veggie pizza$/) do
  find('a[href*="code=P12IREPV"]').click
end
Then(/^the cart is updated$/) do
  within ('div#js-myOrderPage') do
    expect(page).to have_content("Large (14\") Hand Tossed Pizza")
    expect(page).to have_content("Medium (12\") Hand Tossed Pacific Veggie Pizza")
  end
end
And(/^I can click checkout button$/) do
  find('a.btn--checkout').click
end
