*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library    String


*** Test Cases ***
Login to WebOrder with valid credentials
    [Tags]    DEBUG
    #open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     edge
    open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     edge
    #open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     firefox
    #Command        Object Identification               Value
    maximize browser window
    input text      name=ctl00$MainContent$username     Tester
    input text      name=ctl00$MainContent$password     test
    click button    name=ctl00$MainContent$login_button
    page should contain link    Logout
    log to console    get location
Create Order and Verify order got generated
#    click element     XPATH://a[@href="Process.aspx"]
    click link    Order
    input text    ctl00_MainContent_fmwOrder_txtQuantity    5
    input text      XPATH://input[@id='ctl00_MainContent_fmwOrder_txtName']       abcd
    input text      id:ctl00_MainContent_fmwOrder_TextBox2      MG#123
    input text      name:ctl00$MainContent$fmwOrder$TextBox3       Mumbai
    input text      name:ctl00$MainContent$fmwOrder$TextBox5        123456
    select radio button     ctl00$MainContent$fmwOrder$cardList     Visa
#    click element    id:ctl00_MainContent_fmwOrder_cardList_0
    input text      name:ctl00$MainContent$fmwOrder$TextBox6      1234567890
    input text    id:ctl00_MainContent_fmwOrder_TextBox1        12/99
    click link    Process
    click link    View all orders
    sleep   2
    page should contain    abcd
    table row should contain    id:ctl00_MainContent_orderGrid_ctl02_OrderSelector      1       abcd
    sleep    2

Update row value
    click element    xpath://input[@id='ctl00_MainContent_orderGrid_ctl03_OrderSelector']/preceding::input[@type='image']
    sleep   5
    input text    name:ctl00$MainContent$fmwOrder$txtName      xyz
    click link    Update
    table row should contain    id:ctl00_MainContent_orderGrid_ctl02_OrderSelector      1       xyz

   sleep    5
    ${ele_count}=    get element count    xpath://*[@id="ctl00_MainContent_orderGrid"]/tbody/tr/td[2]
#    ${ele_count}=    get element count    xpath://input[@type='image']//following::td[1]

    log to console    ele count:${ele_count}
    FOR    ${i}     IN RANGE    2   ${ele_count}+2
    ${text}     get text    xpath:(//*[@id="ctl00_MainContent_orderGrid"]/tbody/tr)[${i}]/td[2]
#        ${text}     get text    xpath:(//input[@type='image']//following::tr)[${i}]/td[2]
        log to console    ${text}
    END


*** Keywords ***
Logout from application and verify that user has logged out
    click link    Logout

Close the browser at the end
    close all browsers
Gererate random number
    ${Random_Number}    generate random string    8     0123456789
    [Return]    ${Random_Number}

