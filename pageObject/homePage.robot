*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${element}  class:alert-danger
${Expected_Value}   Incorrect username/password.
${ok_button}    id:okayBtn

*** Keywords ***

Fill the form
	[Arguments]     ${username}   ${Valid_Password}
	Input Text    id=username   ${username}
	Input Password    id=password   ${Valid_Password}
	Click Button    id=signInBtn

verify login error message
	wait till locator passed on the landing page   ${element}
	${Error_Msg}=   Get Text    ${element}
	Log    ${Error_Msg}
    Should Be Equal As Strings     ${Expected_Value}    ${Error_Msg}

fill the form and select user option
	Input Text      id=username   ${username}
	Input Password  id=password   ${Valid_Username}
	Click Element   css:input[value='user']
	Select From List By Value    css:select.form-control    teach
	wait till locator passed on the landing page    ${ok_button}
    Click Button    ${ok_button}
    Wait Until Element Is Not Visible   ${ok_button}
    Select Checkbox    terms
    Checkbox Should Be Selected     terms
    Sleep    10S