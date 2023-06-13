*** Settings ***
Documentation       single test for login

Library             SeleniumLibrary


*** Variables ***
${deposit_btn}      //*[text()="Deposit"]//parent::button


*** Test Cases ***
Login
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ****
    Input Password    txtPass    ****
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${deposit_btn}    10
