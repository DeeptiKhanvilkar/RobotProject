*** Settings ***
Documentation    To validate the login form
#Library    AppiumLibrary
Library    SeleniumLibrary
Library    Collections
Test Setup      Launch Website      Chrome
Test Teardown    Close Browser Sessions
Resource        ../pageObject/Generic.robot

*** Variables ***
${main_window_name}
#${mail_id}
${Password}     learning
${link}         xpath://a[@href="mailto:mentor@rahulshettyacademy.com"]
${Child_window_name}

*** Test Cases ***

Verify Child window functionality
	Open Child window for id
	Grab the email id
	Switch to main window of academy    ${mail_id}

*** Keywords ***
Open Child window for id
	${main_window_name}=    Get Window Titles
	Log To Console    ${main_window_name}
	Click Element    xpath://a[@class='blinkingText']
	${Child_window_name}=   Get Window Titles
	Switch Window    ${Child_window_name[1]}
	Log To Console    ${Child_window_name}

Grab the email id
	Wait Until Element Is Visible    ${link}
	${title}=   Get Text    xpath://div[@class='inner-box']
	Element Text Should Be  xpath://div[@class='inner-box']     DOCUMENTS REQUEST
	IF    "${title}"== "DOCUMENTS REQUEST"
		Log To Console    "Switched to child window successfully
	ELSE
		Log To Console    "Switching to child window failed"
	END
	Log To Console    ${title}
	${mail_id}=     Get Text        ${link}
	Log To Console    ${mail_id}
	Sleep    10S
	Set Global Variable    ${mail_id}

Switch to main window of academy
	[Arguments]    ${mail_id}
	${Child_window_name}=   Get Window Titles
	Switch Window       MAIN
	Title Should Be    LoginPage Practise | Rahul Shetty Academy
	#${Child_window_name[0]}
	Input Text    id=username   ${mail_id}
	Input Password    id=password   ${Password}
	Click Button    id=signInBtn
	Sleep    10S







