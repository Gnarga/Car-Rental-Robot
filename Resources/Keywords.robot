*** Variables ***
${BROWSER}     chrome
${URL}          http://rental3.infotiv.net/


*** Keywords ***
Begin Web Test
    Open Browser                                ${URL}  ${BROWSER}
    Maximize Browser Window
Verify page
    page should contain     When do you want to make your trip?
End Web Test
    Close Browser
