*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections

*** Test Cases ***
Example of how to load JSON
# read the raw data
#   ${json}=    Get file    C:/Users/adixit/PycharmProjects/RobotFramework/TestData/login.json
    ${json}=    Get file       \TestData\\Login_Multiple_Data.json
# convert the data to a python object
    ${object}=  Evaluate    json.loads('''${json}''')   json
    ${all_data}=    Set Variable     ${object['Login_details']}
    Log to console      ${object}

    FOR     ${data}  IN      @{all_data}
        ${uname}=    Get From Dictionary   ${data}     uname    # will assign to the variable ${name} the value of the key 'name'; if there is no such key - the keyword will fail
        ${pass}=    Get From Dictionary   ${data}     pass
        ${url}=    Get From Dictionary   ${data}     url
    Open Browser    ${url}  chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    ${uname}
    Input Text    id=ctl00_MainContent_password    ${pass}
    Click Button  id=ctl00_MainContent_login_button
    Sleep   2s
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    click link      Logout
    close browser

    END
