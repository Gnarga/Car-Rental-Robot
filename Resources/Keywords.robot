*** Variables ***
${BROWSER}                      chrome
${URL}                          http://rental3.infotiv.net/
${VALID_MAIL}                   fredrik.wallgren@iths.se
${INVALID_MAIL}                 password123
${VALID_PASSWORD}               123456
${INVALID_PASSWORD}             9999999999
${LOGIN_BUTTON}                 id:login
${CARD_NUMBER}                  1234567890123456
${BOOK_TESLA_R}                 id:bookRoadsterpass2


*** Keywords ***
Begin Web Test
    Open Browser                                ${URL}  ${BROWSER}
    Maximize Browser Window
    Verify page

Verify page
    page should contain     When do you want to make your trip?

End Web Test
    Close Browser

that the user is on the homepage
    Page Should Contain Element         ${LOGIN_BUTTON}

input valid mail and invalid password
    Input Text                          id:email  ${VALID_MAIL}
    Input Text                          id:password  ${INVALID_PASSWORD}

we click the login button
    Click Button                        ${LOGIN_BUTTON}

we shouldn't be able to log in successfully because of wrong password
    Element Should Contain              id:signInError      Wrong e-mail or password

Log in
    Input Text                          id:email  ${VALID_MAIL}
    Input Text                          id:password  ${VALID_PASSWORD}
    Click Button                        ${LOGIN_BUTTON}

Clean-up
    Click Button                        id:mypage
    Click Button                        id:unBook1
    Handle Alert                        accept
    Page Should Contain                 has been Returned

