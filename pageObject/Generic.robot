
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Chrome_Driver_Path}   C:/Users/1030968/Downloads/chrome-win64/chrome-win64
${URL}  https://rahulshettyacademy.com/loginpagePractise/
${Invalid_Password}      1234
${Valid_Username}       rahulshettyacademy
${username}       rahulshettyacademy
${Valid_Password}       learning
${browser}      Edge

*** Keywords ***
# This is if we pass browser name as argument
#Launch Website
#	[Arguments]    ${browser}
#	Create Webdriver    ${browser}      ../resources/${browser}
#	Go To    ${URL}
#	Maximize Browser Window

#if we want to pass browser name through command line then below is the code
Launch Website
	Create Webdriver    ${browser}      ../resources/${browser}
	Go To    ${URL}
	Maximize Browser Window

Close Browser Sessions
	Close Browser

wait till locator passed on the landing page
	[Arguments]    ${locator}
	Wait Until Element Is Visible    ${locator}