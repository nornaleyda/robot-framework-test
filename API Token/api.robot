*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${manage_account_setting}       //a[@class="trading-hub-header__setting"]
${api_token_link}               //a[@id="dc_api-token_link"]
${api_token}                    //article[@class="da-article"]
${read_checkbox}                //input[@class="dc-checkbox__input" and @name="read"]
${trade_checkbox}               //input[@class="dc-checkbox__input" and @name="trade"]
${payments_checkbox}            //input[@class="dc-checkbox__input" and @name="payments"]
${trading_checkbox}             //input[@class="dc-checkbox__input" and @name="trading_information"]
${admin_checkbox}               //input[@class="dc-checkbox__input" and @name="admin"]
${check_checkbox}               //label[@class="dc-checkbox"]
${token_name}                   //input[@class="dc-input__field"]
${error}                        //div[@class="dc-field dc-field--error"]
${create_token}                 //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${copy_icon}                    //*[@data-testid="dt_copy_token_icon"]
${delete_icon}                  //*[@data-testid="dt_token_delete_icon"]
${delete_button}                //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]
${admin_ok}                     //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]


*** Test Cases ***
Open App.Deriv.com
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024

Login
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ****
    Input Password    txtPass    ****
    Click Element    //button[@name="login"]

API Token navigation
    Wait Until Page Contains Element    ${manage_account_setting}    10
    Click Element    ${manage_account_setting}
    Wait Until Page Contains Element    ${api_token_link}    10
    Click Element    ${api_token_link}
    Wait Until Page Contains Element    ${api_token}    10

Checkbox validation for other than admin
    Wait Until Page Contains Element    ${read_checkbox}    10
    Click Element    (${check_checkbox})[1]
    Click Element    (${check_checkbox})[2]
    Click Element    (${check_checkbox})[3]
    Click Element    (${check_checkbox})[4]
    Checkbox Should Be Selected    ${read_checkbox}
    Checkbox Should Be Selected    ${trade_checkbox}
    Checkbox Should Be Selected    ${payments_checkbox}
    Checkbox Should Be Selected    ${trading_checkbox}

Token creation
    Wait Until Element Is Visible    ${token_name}
    Click Element    ${token_name}
    Input Text    ${token_name}    ==
    Element Should Contain    ${error}    Only letters, numbers, and underscores are allowed.
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    p
    Element Should Contain    ${error}    Length of token name must be between 2 and 32 characters.
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    nornaleydabintiroslibinabdullahbin
    Element Should Contain    ${error}    Maximum 32 characters.
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Element Should Contain    ${error}    Please enter a token name.
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Input Text    ${token_name}    norna18
    Wait Until Element Is Visible    ${create_token}    10
    Click Element    ${create_token}

Copy Token
    Wait Until Element Is Visible    ${copy_icon}
    Click Element    ${copy_icon}

Delete Token
    Wait Until Element Is Visible    ${delete_icon}
    Click Element    ${delete_icon}
    Wait Until Element Is Visible    ${delete_button}
    Click Element    ${delete_button}

Checkbox Validation for admin
    Reload Page
    Wait Until Page Contains Element    ${admin_checkbox}    10
    Click Element    (${check_checkbox})[5]
    Checkbox Should Be Selected    ${admin_checkbox}
    Wait Until Element Is Visible    ${token_name}
    Click Element    ${token_name}
    Input Text    ${token_name}    norna06
    Wait Until Element Is Visible    ${create_token}    10
    Click Element    ${create_token}
    Wait Until Element Is Visible    ${copy_icon}
    Click Element    ${copy_icon}
    Wait Until Element Is Visible    ${admin_ok}
    Click Element    ${admin_ok}
    Wait Until Element Is Visible    ${delete_icon}
    Click Element    ${delete_icon}
    Wait Until Element Is Visible    ${delete_button}
    Click Element    ${delete_button}
