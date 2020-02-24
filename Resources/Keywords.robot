*** Variables ***
${BROWSER}                      chrome
${URL}                          http://rental3.infotiv.net/
${VALID_MAIL}                   fredrik.wallgren@iths.se
${INVALID_MAIL}                 password123
${VALID_PASSWORD}               123456
${INVALID_PASSWORD}             12345


*** Keywords ***
Begin Web Test
    Open Browser                                ${URL}  ${BROWSER}
    Maximize Browser Window

Verify page
    page should contain     When do you want to make your trip?

End Web Test
    Close Browser
