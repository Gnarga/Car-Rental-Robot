*** Variables ***
$[{BROWSER}     chrome
${URL}          http://rental3.infotiv.net/
${VA}
${}


*** Keywords ***
Begin Web Test
    Open Browser                                ${BROWSER}
    Maximize Browser Window
    Go To                                       ${URL}