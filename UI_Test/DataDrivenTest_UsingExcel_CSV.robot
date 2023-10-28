#------------------------------DataDriven Test

*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource        ../Resources/commonfunctionality.robot
#Library     DataDriver      ../TestData/LoginValidation_Data.xlsx        sheet_name=Login
Library     DataDriver      ../TestData/LoginValidation_Data.csv

#Preconditoon
Suite Setup     LaunchApplication
#Postcondition
Suite Teardown  CloseApp

Test Template   Invalid Login Scenarios

*** Test Cases ***
Verify WebOrder All Login Scenario ${username} ${password} ${error_msg}

*** Keywords ***
Invalid Login Scenarios
    [Arguments]     ${username}     ${password}         ${error_msg}
    Input Text	    ${txtbox_username_web}      ${username}
    Sleep	2s
    Input Text	    ${txtbox_password_web}      ${password}
    Sleep	2s
    Click Button    ${btn_login_web}
    Sleep	2s
    # Below code for OrangeHRM
    #${count}=  Get Element Count    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']  # Checking whether user on Login page or not
    ${count}=  Get Element Count    id=ctl00_MainContent_status  # Checking whether user on Login page or not
    Run Keyword If  ${count} > 0  Element Should Contain      ${txt_error_web}    ${error_msg}  # If the element is not present we will get the value of count as 0
    ...  ELSE  Element Should Contain      ${lnk_logout_web}    ${error_msg}    click element      ${lnk_logout_web}
