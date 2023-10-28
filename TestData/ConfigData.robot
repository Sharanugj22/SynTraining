#    ------------------------------ConfigData-----------------

*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
${time}
${url}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${url_web}  http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx
${browser}      edge
#Below variables are related to  OrangeHRM Login page application object identification
${txtbox_username}     name=username
${txtbox_password}     name=password
${btn_login}        css=button[type='submit']
${txt_error}        xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']
${lnk_dashboard}    xpath=//span[normalize-space()='Dashboard']
${lnk_welcome}      xpath=//i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon']
${lnk_logout}       link=Logout

#Below variables are related to  WebOrder Login page application object identification
${txtbox_username_web}     id=ctl00_MainContent_username
${txtbox_password_web}     id=ctl00_MainContent_password
${btn_login_web}        id=ctl00_MainContent_login_button
${lnk_logout_web}           link=Logout
${txt_error_web}        id=ctl00_MainContent_status