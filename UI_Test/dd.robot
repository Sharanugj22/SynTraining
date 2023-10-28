*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Login to WebOrder with valid credentials
    [Tags]    DEBUG
    #open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     edge
    open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     chrome
    #open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     firefox
    #Command        Object Identification               Value
    input text      name=ctl00$MainContent$username     Tester
    Provided precondition
    input text      name=ctl00$MainContent$password     test
    input text      name=ctl00$MainContent$username     Tester
    click button    name=ctl00$MainContent$login_button
    page should contain link    Logout


*** Keywords ***
Provided precondition
    clear element text    name=ctl00$MainContent$username
    sleep    2
