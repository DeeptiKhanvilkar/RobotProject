*** Settings ***
Documentation    To validate the login form
#Library    AppiumLibrary
Library    SeleniumLibrary
Library    Collections
#Library    DataDriver
Test Setup      Launch Website      Chrome
Test Teardown    Close Browser Sessions
Resource        ../pageObject/Generic.robot
Resource    ../pageObject/homePage.robot

*** Variables ***
${Expected_Value}   Incorrect username/password.
${element}  class:alert-danger
#${checkout}     css:.nav-link.btn.btn-primary
##${cart_name}    Blackberry
#${final_checkout}   css:btn.btn-success


*** Test Cases ***
Validate unsuccesful login
	homePage.Fill the form       ${Valid_Username}   ${Invalid_Password}
	verify login error message

#Validate cart display on shopping page
#	Fill The Form   ${Valid_Username}   ${Valid_Password}
#	wait for checkout option loads
#	verify cat tiles in the shop page
#    select cart     Blackberry
#
#Select the User radio button
#	fill the form and select user option    ${Valid_Username}   ${Valid_Password}
#
#Open google browser
#	open given url


*** Keywords ***
#open given url
#	Create Webdriver    Chrome  ${Chrome_Driver_Path}
#	Go To    https://www.google.com/
#	Input Text    id=APjFqb         Selenium locators
#	Sleep    10S




verify login error message
	Wait Until Element Is Visible   ${element}  20
	${Error_Msg}=   Get Text    ${element}
	Log    ${Error_Msg}
    Should Be Equal As Strings     ${Expected_Value}    ${Error_Msg}


wait for checkout option loads
	Wait Until Element Is Visible    ${checkout}

verify cat tiles in the shop page
    @{expected_cart_items}=  Create List    iphone X     Samsung Note 8      Nokia Edge  Blackberry
    @{elements}=   Get Webelements    css:.card-title
    @{actual_cart_items}=   Create List
    FOR     ${i}    IN      @{elements}
        Append To List      ${actual_cart_items}     ${i.text}
    END
    Lists Should Be Equal    ${expected_cart_items}     ${actual_cart_items}

select cart
	[Arguments]    ${cart_name}
#    ${cart_name}=   Set Variable  Blackberry
    @{elements}=   Get Webelements    css:.card-title

    #${element}=     //*[@class='card-footer']/button
#    FOR    ${i}     IN RANGE    10
#    	Log To Console    ${i}
#    	IF  ${i}== 5
#    	    Log To Console    ${i}
#    	END
#    END
    ${index}   Set Variable    1
    FOR    ${i}    IN      @{elements}
#     	Log To Console    ${i.text}
    	Exit For Loop If    "${i.text}"=="${cart_name}"
    	${index}=   Evaluate    ${index} + 1
#        ${index}=   Evaluate    ${index}+   1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
#    Sleep    10s
#    Execute Javascript    windows.scrollTo(1500,0)
#    Click Button    ${checkout}
#    Wait Until Element Is Visible    ${final_checkout}


fill the form and select user option
    [arguments]     ${username}   ${Password}
	Input Text      id=username   ${username}
	Input Password  id=password   ${Password}
	Click Element   css:input[value='user']
	Select From List By Value    css:select.form-control    teach
	Wait Until Element Is Visible    id:okayBtn
    Click Button    id:okayBtn
    Wait Until Element Is Not Visible    id:okayBtn
    Select Checkbox    terms
    Checkbox Should Be Selected     terms
    Sleep    10S


