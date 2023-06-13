*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${deposit_btn}      //*[text()="Deposit"]//parent::button
${balance_btn}      //*[text()="Reset Balance"]//parent::button
${deriv_trader}     //a[@href="/"]
${underlying}       //span[@class="ic-icon cq-symbol-dropdown"]
${volatility}       //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
${ticks}            //button[@id="dc_t_toggle_item"]
${5}                //input[@value="5"]
${stake}            //button[@id="dc_stake_toggle_item"]
${10}               //input[@value="10"]
${rise}             //button[@id="dt_purchase_call_button"]
${result}           //a[@class="dc-result__caption-wrapper"]


*** Test Cases ***
Trade    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ****
    Input Password    txtPass   **** 
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${deposit_btn}    10
    Wait Until Page Contains Element    dropdown-display    10
    Click Element    dropdown-display
    Wait Until Element Is Visible    demo    10
    Click Element    demo
    Wait Until Page Contains Element    ${balance_btn}    10
    Wait Until Page Contains Element    ${deriv_trader}    10
    Click Element    ${deriv_trader}
    Wait Until Page Contains Element    ${underlying}    10
    Click Element    ${underlying}
    Wait Until Element Is Visible    ${volatility}    10
    Click Element    ${volatility}
    Wait Until Element Is Visible    ${ticks}    10
    Click Element    ${ticks}
    Wait Until Element Is Visible    ${5}    10
    # Click Element    ${5}
    Wait Until Element Is Visible    ${stake}    10
    Click Element    ${stake}
    Wait Until Element Is Visible    ${10}    10
    Wait Until Element Is Visible    ${rise}    10
    Click Element    ${rise}
    Wait Until Element Is Visible    ${result}    30
