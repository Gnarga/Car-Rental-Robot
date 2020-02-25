*** Settings ***
Documentation                           Infotiv Car Rental, labbarbete
Library                                 SeleniumLibrary
Resource                                ../Resources/Keywords.robot
Test Setup                              Begin Web Test
Test Teardown                           End Web Test

*** Test Cases ***
Valid Login
    [Documentation]                     Test login function with valid inputs, given valid user exist
    [Tags]                              LOGIN_01
    Input Text                          id:email  ${VALID_MAIL}
    Input Text                          id:password  ${VALID_PASSWORD}
    Click Button                        ${LOGIN_BUTTON}
    Element Should Contain              id:welcomePhrase    You are signed in as

Valid Login, not from homepage
    [Documentation]                     Test login function with valid inputs, given valid user exist
    [Tags]                              LOGIN_04
    Click Button                        id:continue
    Input Text                          id:email  ${VALID_MAIL}
    Input Text                          id:password  ${VALID_PASSWORD}
    Click Button                        ${LOGIN_BUTTON}
    Element Should Contain              id:welcomePhrase    You are signed in as

    #boka bil från datum som redan varit

Invalid Login, invalid mail w/ valid pass
    [Documentation]                     Test login funtion with invalid inputs
    [Tags]                              LOGIN_02
    Input Text                          id:email  ${INVALID_MAIL}
    Input Text                          id:password  ${VALID_PASSWORD}
    Click Button                        ${LOGIN_BUTTON}
    Element Should Contain              id:signInError      Wrong e-mail or password

Invalid Login, valid mail w/ invalid pass
    [Documentation]                     Test login funtion with invalid inputs,with Gherkin syntax
    [Tags]                              LOGIN_03
    Given that the user is on the homepage
    And input valid mail and invalid password
    When we click the login button
    Then we shouldn't be able to log in successfully because of wrong password

Book a car, logged in
    [Documentation]                     Book a car with logged in existing user
    [Tags]                              BOOK_01
    Log in
    ${start_date}                       Get Time     month day  NOW
    ${end_date}                         Get Time     month day  NOW + 9 days
    Input Text                          id:start    ${start_date}
    Input Text                          id:end      ${end_date}
    Click Button                        id:continue
    Click Button                        ${BOOK_TESLA_R}
    Input Text                          id:cardNum  ${CARD_NUMBER}
    Input Text                          id:fullName    Bob Doe
    Click Element                       xpath://*[@id="confirmSelection"]/form/select[1]
    Click Element                       id:month6
    Click Element                       xpath://*[@id="confirmSelection"]/form/select[2]
    Click Element                       id:month2023
    Input Text                          id:cvc          123
    Click Button                        id:confirm
    Page should contain                 A Tesla Roadster is now ready for pickup
    Clean-up

Book a car, not logged in
    [Documentation]                     Try to book a car without being logged in
    [Tags]                              BOOK_02
    Click Button                        id:continue
    Wait Until Page Contains Element    ${BOOK_TESLA_R}
    Click Button                        ${BOOK_TESLA_R}
    Alert Should Be Present             text=You need to be logged in to continue.

Book a car, invalid pre-date
    [Documentation]                     To make sure we cant book a car from a date thats already been
    [Tags]                              BOOK_03
    ${datepick}                         Get Time     month day  NOW - 1 day
    Input Text                          id:start      ${datepick}
    Click Button                        id:continue
    Page Should Contain                 When do you want to make your trip?

Book a car, invalid due date
    [Documentation]                     To make sure we cant book a car for too long, max 30 days from start date
    [Tags]                              BOOK_04
    ${datepick}                         Get Time     month day  NOW + 31 day
    Input Text                          id:end      ${datepick}
    Click Button                        id:continue
    Page Should Contain                 When do you want to make your trip?

