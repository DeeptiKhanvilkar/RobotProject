#*** Settings ***
#Documentation  Simple example using AppiumLibrary
#Library  AppiumLibrary
#
#*** Variables ***
#${ANDROID_AUTOMATION_NAME}    UIAutomator2
#${ANDROID_PLATFORM_NAME}      Android
#${ANDROID_PLATFORM_VERSION}   11
#${UDID}     106093737J100088
#
#*** Test Cases ***
#Should send keys to search box and then check the value
#  Open Test Application
#  Input Search Query  Hello World!
#  Submit Search
#  Search Query Should Be Matching  Hello World!
#
#
#*** Keywords ***
#Open Test Application
#  Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
#  ...  platformName=${ANDROID_PLATFORM_NAME}  udid=${UDID} platformVersion=${ANDROID_PLATFORM_VERSION}
#  ...  app=Calculator  appPackage=com.google.android.calculator  appActivity=com.android.calculator2.Calculator
#
#Input Search Query
#  [Arguments]  ${query}
#  Input Text  txt_query_prefill  ${query}
#
#Submit Search
#  Click Element  btn_start_search
#
#Search Query Should Be Matching
#  [Arguments]  ${text}
#  Wait Until Page Contains Element  android:id/search_src_text
#  Element Text Should Be  android:id/search_src_text  ${text}


*** Settings ***
*** Variables ***
*** Test Cases ***
*** Keywords ***
