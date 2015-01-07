#scenario1 navigate to order online page
When(/^I am on the Dominos site/) do
  visit 'http://www.dominos.com'
end

Then(/^the homepage loads/) do
    expect(page).to have_selector('div#Dominos-HomePage')
end

When(/^I click order online link/) do
    click_link('Order Online')
end

Then (/^the order page displays/) do
  page.should have_content('Is this order for delivery or carryout?')
    #page.should have_xpath('//html/body/div[2]/div[1]/div/div/form/div/div[1]/div[2]/h3[1]')
end

#scenario2 delivery or carryout options
Given(/^the delivery option is selected by default$/) do
    #expect(page).to have_xpath('//label[@class='form__input--icon Delivery active']')
  #  expect(page).to have_xpath('//label[@class='form__input--icon Carryout']')
  #  expect(page).to have_xpath('//label[@class='form__input--icon Locations']')
end

When(/^I click carryout button$/) do
  find_button('Carryout').click
end

Then(/^the carryout option is selected$/) do
  #expect(page).to have_xpath('//label[@class='form__input--icon Carryout active' and input/@name='Service_Type']')
  #expect(page).to have_xpath(//label[@class='grid__cell--one-quarter grid__cell--handheld--one' and i/@class='rqd']
  #within(:css, "div.card__body div.js-otherAddress.none div.form__control-group.grid label.grid__cell--one-quarter.grid__cell--handheld--one") do
  #  find("[for="Street"]") working on this line to check that street is not required
  #end
end
