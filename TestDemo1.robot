*** Settings ***
Documentation    Validate Calculator
Library        AppiumLibrary

*** Variables ***
${platformName}     Android
${udid}     106093737J100088
${deviceName}    itel
${platformVersion}      13
${fullReset}     false
${noReset}       true
${appPackage}  com.transsion.calculator
${appActivity}     com.transsion.calculator.Calculator
#${appPackage}  com.google.android.calendar
#${appActivity}     com.android.calendar.LaunchActivity
${systemPort}   8201
${ANDROID_AUTOMATION_NAME}    UIAutomator2


*** Test Cases ***
validate arithmatic operations
#	Open Application  http://127.0.0.1:4723   appium:automationName=${ANDROID_AUTOMATION_NAME}
#  ...  platformName=${platformName}  platformVersion=${platformVersion}
#  ...  appium:appPackage=${appPackage}  appium:appActivity=${appActivity}   appium:udid=106093737J100088
	#Open Application    http://127.0.0.1:4723    deviceName=itel P55 5G    platformName=Android    appPackage=${appPackage} appActivity=${appActivity} automationName=Appium
	launch calculator
	addition operation
	verify result

*** Keywords ***
launch calculator
	Open Application    http://127.0.0.1:4723  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=android  platformVersion=${platformVersion}
  ...  appPackage=${appPackage}  appActivity=${appActivity} udid=${udid}

addition operation
    Click Element   id=com.transsion.calculator:id/digit_8
    Click Element    id=com.transsion.calculator:id/op_add
    Click Element    id=com.transsion.calculator:id/digit_5
    Click Element    id=com.transsion.calculator:id/eq

verify result
#	${result} =
    ${result}   Get Text    id=com.transsion.calculator:id/result
    Log    ${result}
    Should Be Equal    ${result}    13
