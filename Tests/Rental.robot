*** Settings ***
Documentation                           Infortiv Car Rental, labbarbete
Library                                 SeleniumLibrary
Resource                                ../Resources/Keywords.robot
Test Setup                              Begin Web Test
#Test Teardown                           End Web Test

*** Test Cases ***
Valid Login
    [Documentation]                     Test login function with valid inputs, given valid user exist
    [Tags]                              LOGIN_01
    Input Text                          id:email  ${VALID_MAIL}
    Input Text                          id:password  ${VALID_PASSWORD}
    Click Button                        ${LOGIN_BUTTON}
    Element Should Contain              id:welcomePhrase    You are signed in as

Invalid Login, invalid mail w/ valid pass
    [Documentation]                     Test login funtion with invalid inputs
    [Tags]                              LOGIN_02
    Input Text                          id:email  ${INVALID_MAIL}
    Input Text                          id:password  ${VALID_PASSWORD}
    Click Button                        ${LOGIN_BUTTON}
    Element Should Contain              id:signInError      Wrong e-mail or password

Invalid Login, valid mail w/ invalid pass
    [Documentation]                     Test login funtion with invalid inputs,with Gherkin method
    [Tags]                              LOGIN_03
    given we are on the homepage
    and input the email address and the password
    when we click log in button
    then we shouldn't be able to log in successfully because of wrong password

Book a car, logged in
    [Documentation]                     Book a car with logged in existing user
    [Tags]                              BOOK_01
    Log in
    Set Selenium Speed                  0.3
    #Vi skippar välja datum för det är tydligen omöjligt, utan nöjer oss låna bilen över aktuella dagen endast
    Click Button                        id:continue
    Click Button                        id:bookRoadsterpass2
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
    #Vi skippar välja datum för det är tydligen omöjligt, utan nöjer oss låna bilen över aktuella dagen endast
    Click Button                        id:continue
    Wait Until Page Contains Element    id:bookRoadsterpass2
    Click Button                        id:bookRoadsterpass2
    Alert Should Be Present             text=You need to be logged in to continue.

Tidsboking
    [Tags]                              BOOK_03
    Input Text                          id:start    03-05
    Input Text                          id:end      03-16
    Click Button                        id:continue
