*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${terms_and_conditions}     css:.checkbox label
${india_country}            xpath://div[@class= 'suggestions']/ul/li/a
${purchase}                 css:input.btn-success
${order_confirm}            css:div.alert-success

*** Keywords ***
enter country
	[Arguments]    ${country_name}  ${selection}
	Input Text    id:country        ${country_name}
	Wait Until Element Is Visible    ${selection}   20
	Click Element    ${selection}


accept terms and conditions
#	sleep           10
    Click Element       ${terms_and_conditions}

click on purchase
	Click Element    ${purchase}


verify confirmation message
	Wait Until Element Is Visible    ${order_confirm}
	${order_success}=   Get Text    ${order_confirm}
	Log    ${order_success}
	Element Should Contain    ${order_confirm}      Success