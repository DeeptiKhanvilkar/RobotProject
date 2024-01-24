*** Settings ***
Documentation    All the page objects and keywords of landing page
Library    SeleniumLibrary
#Library    DataDriver   file=../pageObject/resources/data.csv     encoding=utf_8
Resource    Generic.robot

*** Variables ***
${checkout}     css:a.btn-primary
${product_name}     Blackberry

*** Keywords ***
wait for checkout option loads
	wait till locator passed on the landing page    ${checkout}


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
    @{elements}=   Get Webelements    css:.card-title
    ${index}   Set Variable    1
    FOR    ${i}    IN      @{elements}
    	Exit For Loop If    "${i.text}"=="${cart_name}"
    	${index}=   Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button


click on checkout button
	Click Element   ${checkout}