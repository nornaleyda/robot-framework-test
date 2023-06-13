*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${deposit_btn}      //*[text()="Deposit"]//parent::button
${balance_btn}      //*[text()="Reset Balance"]//parent::button


*** Test Cases ***
Open App Deriv
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ****
    Input Password    txtPass    ****
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${deposit_btn}    10
    Wait Until Page Contains Element    dropdown-display    10
    Click Element    dropdown-display
    Wait Until Element Is Visible    demo    10
    Click Element    demo
    Wait Until Page Contains Element    ${balance_btn}    10
