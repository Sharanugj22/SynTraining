*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource        ../TestData/ConfigData.robot
Library     RequestsLibrary
#Need to use Collections Library if you are using List of dictionary objectx
Library     Collections
Library     JSONLibrary
Library     OperatingSystem
*** Variables ***
${base_url}     https://demo.spreecommerce.org
*** Keywords ***
Create Token
    create session      mysession   ${base_url}
    #"Content-Type":"application/json"
    ${header}=       create dictionary       Content-Type=application/json
    ${req_body}=    get file    API_Test_Demo/Spreecom_API_New/TestData/CreateToken.json
    log to console      ${req_body}
    ${json_body}=   convert string to json      ${req_body}
    ${response}=    post on session         mysession       /spree_oauth/token      json=${json_body}        headers=${header}
    #${response}=    post on session     mysession   /spree_oauth/token    data=${req_body}
    log to console      ${response.status_code}
    ${response_body}=      To Json     ${response.content}     pretty_print = True
    log to console      ${response_body}
    #log to console      ${response.headers}

    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}

#Check token from Response Body
    ${access_token}=      get value from json  ${response.json()}        $.access_token
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${access_token}
    ${access_token_final}=      Set Variable    ${access_token[0]}
    Log to console      ${access_token_final}

LogintoWebOrder
    open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     chrome
    maximize browser window
    input text      name=ctl00$MainContent$username     Tester
    input text      name=ctl00$MainContent$password     test
    click button    name=ctl00$MainContent$login_button
    page should contain link    Logout

LaunchApplication
    Open Browser        ${url_web}      ${browser}
    Maximize Browser Window
    #Sleep   2s
CloseApp
    Close Browser

Enter Username
    [Arguments]     ${username}
    Input Text      ${txtbox_username}      ${username}

Enter Password
    [Arguments]     ${password}
    Input Text      ${txtbox_password}      ${password}
Click On Login Button
    Click Button        ${btn_login}
Click On Logout Link
    Click link      ${lnk_welcome}
    Sleep       2s
    Click link      ${lnk_logout}
Verify Home Page
    Page Should Contain     Dashboard
# Web Order Application Keyword function
Enter Username Web
    [Arguments]     ${username}
    Input Text      ${txtbox_username_web}      ${username}

Enter Password Web
    [Arguments]     ${password}
    Input Text      ${txtbox_password_web}      ${password}
Click On Login Button Web
    Click Button        ${btn_login_web}

Click On Logout Link Web
    Click link      ${lnk_logout_web}