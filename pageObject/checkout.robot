*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${selected_product_name}     css: h4.media-heading a

*** Keywords ***
verify product name
	[Arguments]    ${expected_product_name}
	${product_in_cart}=     Get Text    ${selected_product_name}
	Log    ${product_in_cart}
	Should Be Equal As Strings    ${product_in_cart}    ${expected_product_name}

click on final checkout
	[Arguments]    ${final_checkout}
	Click Element    ${final_checkout}
