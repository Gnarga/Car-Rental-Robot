*** Settings ***
Documentation                           Infortiv Car Rental, labbarbete
Library                                 SeleniumLibrary
Resource                                ../Resources/Keywords.robot
Test Setup                              Begin Web Test
Test Teardown                           End Web Test

*** Test Cases ***
Valid Login
    [Documentation]                     Test login function with valid inputs
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
