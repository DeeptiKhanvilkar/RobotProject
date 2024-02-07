*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_URL}     http://216.10.245.166
${ID}       bcd0227
${book_ID}
${book_name}        RobotFramework
*** Test Cases ***

play around dictionary
	&{dictionary_data}       Create Dictionary    name=deepti    age=34  gender=female
	log     ${dictionary_data}
	Dictionary Should Contain Key    ${dictionary_data}     name
	log     ${dictionary_data}[name]
	${value}=   Get From Dictionary    ${dictionary_data}       gender
	log     ${value}


first api request
    ${response}=    GET  https://www.google.com
    log     ${response}

add book into db
	[Tags]    API
	&{book}=    Create Dictionary    name=${book_name}   isbn=bcd   aisle=5227  author=John foe
    ${response}=    POST    ${base_URL}/Library/Addbook.php         json=${book}    expected_status=200
    log     ${response.json()}
    Dictionary Should Contain Key    ${response.json()}     ID
    Dictionary Should Contain Key    ${response.json()}     Msg
    ${book_msg}=    Get From Dictionary    ${response.json()}   Msg
    log     ${book_msg}
#    Should Be Equal As Strings    ${book_msg}       successfully added
    ${ID}=  Get From Dictionary    ${response.json()}     ID
    log     ${response.json()}
    Set Global Variable   ${ID}

get id of added book
	[Tags]    API
	${response}=    GET    ${base_URL}/Library/GetBook.php      params=ID=${ID}
	log     ${ID}
    Status Should Be    200
    log     ${response.json()}
    Should Be Equal As Strings    ${book_name}          ${response.json()}[0][book_name]
    log     ${response.json()}

delete requested book
	[Tags]    API
	&{ID_data}      Create Dictionary    ID=${ID}
	${response}=        POST    ${base_URL}/Library/DeleteBook.php        json=${ID_data}
	log     ${response.json()}
	Status Should Be    200
	Should Be Equal As Strings    book is successfully deleted     ${response.json()}[msg]


