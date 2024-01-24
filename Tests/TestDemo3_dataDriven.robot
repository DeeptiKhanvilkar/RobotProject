*** Settings ***
Documentation    To validate the login form
#Library    AppiumLibrary
Library    SeleniumLibrary
Library    Collections
Test Setup  Launch Website
#Library    DataDriver       file=../pageObject/resources/data.csv     encoding=utf_8
#Test Setup      Launch Website      Edge
Test Teardown    Close Browser Sessions
Resource        ../pageObject/Generic.robot
Resource        ../pageObject/homePage.robot
Resource        ../pageObject/shopPage.robot
Resource        ../pageObject/checkout.robot
Resource        ../pageObject/confirmation.robot
#Test Template    Validate unsuccesful login
#Test Template    Validate cart display on shopping page


*** Variables ***

#${cart_name}    Blackberry
${final_checkout}   css:button.btn-success
${expected_product_name}     Blackberry
${country_name}         India

#*** Test Cases ***         username             password
#Invalid username            djfbk               learning
#Invalid password            rahulshettyacademy  sbjcbdsie
#Speacial charachers         @#$%                WSER#$%

*** Test Cases ***
#login with ${username} and ${password}      abf     1234

Validate unsuccesful login
    [Tags]      SMOKE
	homePage.Fill the form       ${username}   ${Invalid_Password}
	homePage.verify login error message

Validate cart display on shopping page
#	[Arguments]    ${Valid_Username}    ${Valid_Password}
    homePage.Fill The Form   ${username}   ${Valid_Password}
	shopPage.wait for checkout option loads
	shopPage.verify cat tiles in the shop page
    shopPage.select cart     ${product_name}
    click on checkout button
    Wait Until Element Is Visible    ${final_checkout}
    verify product name     ${product_name}
    checkout.Click On Final Checkout    ${final_checkout}
    confirmation.enter country       ${country_name}          xpath://a[text()='${country_name}']
    confirmation.accept terms and conditions
    click on purchase
    verify confirmation message
#check the details on checkout page

Select the User radio button
	fill the form and select user option











