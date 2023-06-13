*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${deposit_btn}          //*[text()="Deposit"]//parent::button
${balance_btn}          //*[text()="Reset Balance"]//parent::button
${deriv_trader}         //a[@href="/"]
${underlying}           //span[@class="ic-icon cq-symbol-dropdown"]
${volatility}           //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
${ticks}                //button[@id="dc_t_toggle_item"]
${5}                    //input[@value="5"]
${stake}                //button[@id="dc_stake_toggle_item"]
${10}                   //input[@value="10"]
${rise}                 //button[@id="dt_purchase_call_button"]
${result}               //a[@class="dc-result__caption-wrapper"]
${Forex}                //span[@class="ic-icon ic-forex"]
${AUD/USD}              //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
${type}                 //div[@id="dt_contract_dropdown"]
${lower}                //div[@id="dt_contract_high_low_item"]
${duration}             //button[@id="dc_duration_toggle_item"]
${date_picker}          //div[@class="dc-input dc-datepicker__input dc-datepicker__input--has-leading-icon"]
${4}                    //input[@value="4"]
${stake}                //button[@id="dc_stake_toggle_item"]
${payout}               //button[@id="dc_payout_toggle_item"]
${amount}               //input[@aria-label="Amount"]
${lower_contract}       //button[@id="dt_purchase_put_button"]
${contract}             //a[@class="dc-contract-card dc-contract-card--red"]


*** Test Cases ***
Trade    Open Browser    https://app.deriv.com    Chrome
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
    Wait Until Page Contains Element    ${deriv_trader}    10
    Click Element    ${deriv_trader}
    Wait Until Page Contains Element    ${underlying}    10
    Click Element    ${underlying}
    Wait Until Element Is Visible    ${Forex}    10
    Click Element    ${Forex}
    Wait Until Page Contains Element    ${AUD/USD}    10
    Click Element    ${AUD/USD}
    Wait Until Page Contains Element    ${type}    10
    Click Element    ${type}
    Wait Until Page Contains Element    ${lower}    10
    Click Element    ${lower}
    Wait Until Page Contains Element    ${duration}    10
    Click Element    ${duration}
    Wait Until Page Contains Element    ${date_picker}    10
    Click Element    ${date_picker}
    Press Keys    ${date_picker}    CTRL+a+BACKSPACE
    Press Keys    ${date_picker}    2
    Wait Until Page Contains Element    ${payout}    10
    Click Element    ${payout}
    Wait Until Page Contains Element    ${amount}    10
    Press Keys    ${amount}    CTRL+a+BACKSPACE
    Input Text    ${amount}    15.50
    Wait Until Element Is Visible    ${lower_contract}    10
    Wait Until Element Is Enabled    ${lower_contract}    10
    Click Element    ${lower_contract}
    Wait Until Element Is Visible    ${contract}    20
