*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${deposit_btn}              //*[text()="Deposit"]//parent::button
${balance_btn}              //*[text()="Reset Balance"]//parent::button
${deriv_trader}             //a[@href="/"]
${underlying}               //span[@class="ic-icon cq-symbol-dropdown"]
${volatility}               //div[@class="sc-mcd__item sc-mcd__item--R_50 "]
${contract_type}            //div[@data-testid="dt_contract_dropdown"]
${multiplier}               //div[@id="dt_contract_multiplier_item"]
${stake}                    //div[@class="trade-container__fieldset-header trade-container__fieldset-header--inline"]
${take_profit}              //label[@class="dc-checkbox take_profit-checkbox__input"]
${take_profit_checkbox}     //input[@id="dc_take_profit-checkbox_input"]
${stop_loss}                //label[@class="dc-checkbox stop_loss-checkbox__input"]
${stop_loss_checkbox}       //input[@id="dc_stop_loss-checkbox_input"]
${deal_cancel}              //label[@for="dt_cancellation-checkbox_input"]
${deal_cancel_checkbox}     //input[@id="dt_cancellation-checkbox_input"]
${dropdown_multiplier}      //span[@class="dc-text dc-dropdown__display-text" and @name="multiplier"]
${x20}                      //div[@id="20"]
${x40}                      //div[@id="40"]
${x60}                      //div[@id="60"]
${x100}                     //div[@id="100"]
${x200}                     //div[@id="200"]
${amount}                   //input[@aria-label="Amount"]
${contract_up}              //button[@id="dt_purchase_multup_button"]
${contract_down}            //button[@id="dt_purchase_multdown_button"]
${add}                      //button[@id="dt_amount_input_add"]
${value_1}                  //input[@value="1"]
${sub}                      //button[@id="dt_amount_input_sub"]
${value_0}                  //input[@value="0"]
${cancel_opt}               //span[@class="dc-text dc-dropdown__display-text" and @name="cancellation_duration"]
${5min}                     //div[@id="5m"]
${10min}                    //div[@id="10m"]
${15min}                    //div[@id="15m"]
${30min}                    //div[@id="30m"]
${60min}                    //div[@id="60m"]
${fee}                      //span[@class="trade-container__price-info-currency"]
${amount_field}             //input[@id="dt_amount_input"]


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
    Wait Until Element Is Visible    ${volatility}    10
    Click Element    ${volatility}
    Wait Until Element Is Visible    ${contract_type}    10
    Click Element    ${contract_type}
    Wait Until Element Is Visible    ${multiplier}    10

a. only stake
    Click Element    ${multiplier}
    Wait Until Element Is Visible    ${stake}    10

b. checkbox
    Wait Until Page Contains Element    ${take_profit}    10
    Click Element    ${take_profit}
    Checkbox Should Be Selected    ${take_profit_checkbox}
    Checkbox Should Not Be Selected    ${stop_loss_checkbox}
    Checkbox Should Not Be Selected    ${deal_cancel_checkbox}
    Wait Until Page Contains Element    ${stop_loss}    10
    Click Element    ${stop_loss}
    Checkbox Should Be Selected    ${stop_loss_checkbox}
    Checkbox Should Be Selected    ${take_profit_checkbox}
    Checkbox Should Not Be Selected    ${deal_cancel_checkbox}
    Wait Until Page Contains Element    ${deal_cancel}    10
    Click Element    ${deal_cancel}
    Checkbox Should Be Selected    ${deal_cancel_checkbox}
    Checkbox Should Not Be Selected    ${stop_loss_checkbox}
    Checkbox Should Not Be Selected    ${take_profit_checkbox}
    Click Element    ${deal_cancel}
    Checkbox Should Not Be Selected    ${deal_cancel_checkbox}

c. multiplier
    Wait Until Element Is Visible    ${dropdown_multiplier}    10
    Click Element    ${dropdown_multiplier}
    Wait Until Element Is Visible    ${x20}    10
    Wait Until Element Is Visible    ${x40}    10
    Wait Until Element Is Visible    ${x60}    10
    Wait Until Element Is Visible    ${x100}    10
    Wait Until Element Is Visible    ${x200}    10

d. cancelation fee
    Wait Until Page Contains Element    ${deal_cancel}    10
    Click Element    ${deal_cancel}
    Checkbox Should Be Selected    ${deal_cancel_checkbox}
    Press Keys    ${amount}    CTRL+a+BACKSPACE
    Input Text    ${amount}    1
    Wait Until Element Is Visible    ${fee}    30
    ${cancel_fee}    Get Text    ${fee}
    ${cancel_fee}    Set Variable    ${cancel_fee[:-4]}
    Press Keys    ${amount}    CTRL+a+BACKSPACE
    Input Text    ${amount_field}    2
    Wait Until Element Is Visible    ${fee}    30
    ${updated_fee}    Get Text    ${fee}
    ${updated_fee}    Set Variable    ${updated_fee[:-4]}
    Should Be True    ${updated_fee} > ${cancel_fee}

e. max stake is 2000
    Wait Until Element Is Visible    ${amount}    10
    Click Element    ${amount}
    Press Keys    ${amount}    CTRL+a+BACKSPACE
    Input Text    ${amount}    2001
    Wait Until Page Contains Element    ${contract_up}    10
    Element Should Be Disabled    ${contract_up}
    Wait Until Page Contains Element    ${contract_down}    10
    Element Should Be Disabled    ${contract_down}

f. min stake 1
    Wait Until Element Is Visible    ${amount}    10
    Click Element    ${amount}
    Press Keys    ${amount}    CTRL+a+BACKSPACE
    Input Text    ${amount}    0
    Wait Until Page Contains Element    ${contract_up}    10
    Element Should Be Disabled    ${contract_up}
    Wait Until Page Contains Element    ${contract_down}    10
    Element Should Be Disabled    ${contract_down}

g. (+)
    Wait Until Element Is Visible    ${amount}    10
    Press Keys    ${amount}    CTRL+a+BACKSPACE
    Wait Until Element Is Visible    ${add}    10
    Click Element    ${add}
    Wait Until Element Is Visible    ${value_1}    1

h. (-)
    Wait Until Element Is Visible    ${amount}    10
    Press Keys    ${amount}    CTRL+a+BACKSPACE
    Wait Until Element Is Visible    ${add}    10
    Click Element    ${add}
    Wait Until Element Is Visible    ${value_1}    1
    Wait Until Element Is Visible    ${sub}    10
    Click Element    ${sub}
    Wait Until Element Is Visible    ${value_0}    10

i. deal cancelation option
    Wait Until Page Contains Element    ${deal_cancel}    10
    # Click Element    ${deal_cancel}
    # Checkbox Should Be Selected    ${deal_cancel_checkbox}
    Wait Until Page Contains Element    ${cancel_opt}    10
    Click Element    ${cancel_opt}
    Wait Until Element Is Visible    ${5min}    10
    Wait Until Element Is Visible    ${10min}    10
    Wait Until Element Is Visible    ${15min}    10
    Wait Until Element Is Visible    ${30min}    10
    Wait Until Element Is Visible    ${60min}    10
