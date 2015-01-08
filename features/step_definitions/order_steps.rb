#scenario1 navigate to order online page
Given(/^I am on the Dominos site/) do
  visit 'https://order.dominos.com/en/'
end

When(/^the homepage loads/) do
    expect(page).to have_selector(:id, 'homePage')
end

And(/^I click order online link/) do
    click_link('Order Online')
end

Then (/^the order page displays/) do
    expect(page).to have_content("Is this order for delivery or carryout?")
end

#scenario2 delivery or carryout options
Given(/^the delivery option is selected by default$/) do
  expect(page).to have_css("#form__input--icon Delivery active")
  #expect(page).to have_selector("input", :value =>"Delivery")
#  expect(page).to have_selector("input",:value => 'Carryout')

end

When(/^I click carryout button$/) do
  find_button('Carryout').click
end

Then(/^the carryout option is selected$/) do
  pending
end
