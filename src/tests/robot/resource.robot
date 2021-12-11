*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${SERVER}  localhost:5000
${BROWSER}  headlesschrome
${DELAY}  0 seconds
${HOME URL}  http://${SERVER}
${NEW BOOK URL}  http://${SERVER}/new_book
${NEW BLOG URL}  http://${SERVER}/new_blog
${NEW VIDEO URL}  http://${SERVER}/new_video
${NEW PODCAST URL}  http://${SERVER}/new_podcast
${LISTA URL}  http://${SERVER}/list
${REGISTER URL}  http://${SERVER}/register

*** Keywords ***
Open And Configure Browser
    Open Browser  browser=${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}

Go To Main Page
    Go To  ${HOME URL}

Main Page Should Be Open
    Title Should Be  Etusivu

Go To New Book Page
    Go To  ${NEW BOOK URL}

Go To New Blog Page
    Go To  ${NEW BLOG URL}

Go To New Video Page
    Go To  ${NEW VIDEO URL}

Go To New Podacst Page
    Go To  ${NEW PODCAST URL}

Go To Register Page
    Go To  ${REGISTER URL}

New Book Page Should Be Open
    Title Should Be  Uusi kirjavinkki

New Blog Page Should Be Open
    Title Should be  Uusi blogivinkki

New Video Page Should Be Open
    Title Should Be  Uusi videovinkki

New Podcast Page Should Be Open
    Title Should be  Uusi podcastvinkki

Confirm Page Should Be Open
    Title Should be  Confirm

Confirm Video Page Should Be Open
    Title Should Be  Confirm video

Go To Lista Page
    Go To  ${LISTA URL}

List Page Should Be Open
    Title Should Be  Lukuvinkit

Error Page Should Be Open
    Title Should Be  Virhe

Input Book Info
    [Arguments]  ${otsikko}  ${kirjoittaja}  ${isbn}  ${kommentti}
    Input Text  otsikko  ${otsikko}
    Input Text  kirjoittaja  ${kirjoittaja}
    Input Text  isbn  ${isbn}
    Input Text  kommentti  ${kommentti}

Input ISBN
    [Arguments]  ${isbn}
    Input Text  book_isbn  ${isbn}

Input URL
    [Arguments]  ${url}
    Input Text  video_id  ${url}

Input Blog Info
    [Arguments]  ${nimi}  ${kirjoittaja}  ${url}  ${kommentti}
    Input Text  nimi  ${nimi}
    Input Text  kirjoittaja  ${kirjoittaja}
    Input Text  url  ${url}
    Input Text  kommentti  ${kommentti}

Input Video Info
    [Arguments]  ${nimi}  ${tekija}  ${url}  ${kommentti}
    Input Text  nimi  ${nimi}
    Input Text  tekija  ${tekija}
    Input Text  url  ${url}
    Input Text  kommentti  ${kommentti}

Input Podcast Info
    [Arguments]  ${nimi}  ${tekija}  ${jakson_nimi}  ${kommentti}
    Input Text  nimi  ${nimi}
    Input Text  tekija  ${tekija}
    Input Text  jakson_nimi  ${jakson_nimi}
    Input Text  kommentti  ${kommentti}

Submit vinkki
    Click Button  Luo vinkki

Submit ISBN/URL
    Click Button  Etsi

Submit Registration
    Click Button  Luo käyttäjätunnus

Input Register Info
    [Arguments]  ${tunnus}  ${salasana}  ${salasana_uudelleen}
    Input Text  tunnus  ${tunnus}
    Input Text  salasana  ${salasana}
    Input Text  salasana_uudelleen  ${salasana_uudelleen} 

Create Random Username
    ${RANDOM NAME}  Generate Random String  5  [LETTERS][NUMBERS]
    [Return]  ${RANDOM NAME}
