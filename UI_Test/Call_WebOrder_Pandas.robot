*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String
Library     ../Resources/UserKeywords.py
Library     Collections
Library     ../Resources/Get_Matching_String.py

*** Variables ***
#${EXCEL_FILE_PATH}      C:\\Training_Scripts\\PycharmProjects\\RobotFramework_New\\TestData\\OrangeData.xlsx
${COL_NAME}       Name
${VALUE}        Dixit
*** Test Cases ***
TC_001-Launch WebOrder and login to application
    [Tags]      Test
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete


Click on Order and Enter the Details
    Click Link      link=Order
    Sleep       2s
    Select From List By Label	id=ctl00_MainContent_fmwOrder_ddlProduct    FamilyAlbum
    Input Text	id=ctl00_MainContent_fmwOrder_txtName       Dixit
    Input Text  id=ctl00_MainContent_fmwOrder_txtQuantity   5
    Input Text	id=ctl00_MainContent_fmwOrder_TextBox2       MG Road
    Input Text	id=ctl00_MainContent_fmwOrder_TextBox3       Bangalore
    Input Text	id=ctl00_MainContent_fmwOrder_TextBox5       560001
    Select Radio Button     ctl00$MainContent$fmwOrder$cardList        Visa
    Input Text	id=ctl00_MainContent_fmwOrder_TextBox6       123456789
    Input Text	id=ctl00_MainContent_fmwOrder_TextBox1       12/22
    Click Element       id=ctl00_MainContent_fmwOrder_InsertButton
Go to View All Orders and Verify that user got added
    Click Link      link=View all orders
    Sleep   2s
    ${tabledata}=       get element attribute       //table[@id='ctl00_MainContent_orderGrid']      outerHTML
#   Using Panda code--------------------------------
    #@{pandadata}=       Panda Table     ${tabledata}
    @{pandadata}=      Panda CommonFunction        ${tabledata}     ${COL_NAME}
    Log to console      ${pandadata}
    list should contain value       ${pandadata}        ${VALUE}
#   End Panda code--------------------------------
    @{MatchingString}=   Get Matching String     ${VALUE}    @{pandadata}

Logout and Close Browser at end
    Click Link      Logout
    Page Should Contain Button    id=ctl00_MainContent_login_button

Close Browser at end
    Close Browser