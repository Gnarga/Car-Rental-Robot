*** Variables ***
$[{BROWSER}     chrome
${URL}          http://rental3.infotiv.net/
${VA}
${}


*** Keywords ***
Begin Web Test
    Open Browser                                ${URL}  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser
