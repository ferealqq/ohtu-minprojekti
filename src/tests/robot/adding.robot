*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Go To New Book Page

*** Test Cases ***
Add A Book
    Input Book Info  testi  testikirjoittaja  01234  hyva kirja
    Submit vinkki
    List Page Should Be Open

Add A Book Wrong
    Input Book Info  testi  \  01234  hyva kirja
    Submit vinkki
    Error Page Should Be Open

Add A Book By ISBN
    Input ISBN  951-31-1146-6
    Submit ISBN
    Confirm Page Should Be Open

Add A Book By Wrong ISBN
    Input ISBN  123
    Submit ISBN
    Error Page Should Be Open

Add A Blog
    Go To New Blog Page
    Input Blog Info  testi  testikirjoittaja  wwww.fi.fi  hyva blogi
    Submit vinkki
    List Page Should Be Open

Add A Blog Wrong
    Go To New Blog Page
    Input Blog Info  testi  \  wwww.fi.fi  hyva blogi
    Submit vinkki
    Error Page Should Be Open

Add A Video
    Go To New Video Page
    Input Video Info  testivideo  videon tekija  youtube.com/asgfhj  hyvä vidi
    Submit vinkki
    List Page Should Be Open

Add A Video Wrong
    Go To New Video Page
    Input Video Info  testivideo  aaa  \  paras vidi
    Submit vinkki
    Error Page Should Be Open

Add A Podcast
    Go To New Podacst Page
    Input Podcast Info  podacst  julien  eka jakso  paras podcast
    Submit vinkki
    List Page Should Be Open

Add A Podcast Wrong
    Go To New Podacst Page
    Input Podcast Info  podcast  julien  \  ok
    Submit vinkki
    Error Page Should Be Open

