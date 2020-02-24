*** Settings ***
Documentation                           Infortiv Car Rental, labbarbete
Library                                 SeleniumLibrary
Resource                                ../Resources/Keywords.robot
Test Setup                              Begin Web Test
Test Teardown                           End Web Test

*** Test Cases ***
Valid login
    [DOCUMENTATION]                     Test login function with valid inputs
    [TAGS]                              LOGIN_01
    Input Text                          id:email  ${VALID_MAIL}
    Input Text                          id:password  ${VALID_PASSWORD}
    Click Button                        ${LOGIN_BUTTON}
    Element Should Contain              id:welcomePhrase    You are signed in as