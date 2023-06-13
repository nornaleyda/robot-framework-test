*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${manage_account_setting}           //a[@class="trading-hub-header__setting"]
${close_account_link}               //a[@id="dc_close-your-account_link"]
${close_account}                    //p[@class="dc-text closing-account__information--bold"]
${cancel_button}                    //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]
${deposit_btn}                      //*[text()="Deposit"]//parent::button
${close_my_account_button}          //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
${close_account_interface}          //p[@class="dc-text closing-account-reasons__title"]
${check_checkbox}                   //label[@class="dc-checkbox closing-account-reasons__checkbox"]
${continue_button}                  //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${financial}                        //input[@class="dc-checkbox__input" and @name="financial-priorities"]
${stop_trading}                     //input[@class="dc-checkbox__input" and @name="stop-trading"]
${not_interested}                   //input[@class="dc-checkbox__input" and @name="not-interested"]
${another_website}                  //input[@class="dc-checkbox__input" and @name="another-website"]
${not_user_friendly}                //input[@class="dc-checkbox__input" and @name="not-user-friendly"]
${difficult_transactions}           //input[@class="dc-checkbox__input" and @name="difficult-transactions"]
${lack_of_feature}                  //input[@class="dc-checkbox__input" and @name="lack-of-features"]
${unsatisfactory_service}           //input[@class="dc-checkbox__input" and @name="unsatisfactory-service"]
${other_reasons}                    //input[@class="dc-checkbox__input" and @name="other-reasons"]
${trading_platform}                 //textarea[@name="other_trading_platforms"]
${improve}                          //textarea[@name="do_to_improve"]
${close_warning}                    //span[@class="dc-text account-closure-warning-modal__warning-message"]
${close_account_button}             //*[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]//button[2]
${verify_account_close}             //p[@class="dc-text account-closed"]
${login_button}                     //button[@id="dm-nav-login-button"]
${start_trading_button}             //button[@id="btnGrant"]
${manage_account_setting_2}         //a[@class="account-settings-toggle"]
${go_back_close_account_button}     //*[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]//button[1]
${back_button}                      //div[@class="dc-form-submit-button dc-form-submit-button--relative"]//button[1]
${cancel_button_2}                  //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]


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

Close Account navigation
    Wait Until Page Contains Element    ${manage_account_setting}    10
    Click Element    ${manage_account_setting}
    Wait Until Page Contains Element    ${close_account_link}    10
    Click Element    ${close_account_link}
    Wait Until Page Contains Element    ${close_account}    10

Close my account button validation
    Reload Page
    Wait Until Page Contains Element    ${close_my_account_button}    10
    Click Element    ${close_my_account_button}
    Wait Until Page Contains Element    ${close_account_interface}    10
    Wait Until Page Contains Element    ${check_checkbox}    10
    Element Should Be Disabled    ${continue_button}

Checkbox validation for no checkbox check
    Wait Until Page Contains Element    ${check_checkbox}    10
    Element Should Be Disabled    ${continue_button}

Checkbox validation for one checkbox
    Wait Until Page Contains Element    ${check_checkbox}    10
    Click Element    (${check_checkbox})[1]
    Checkbox Should Be Selected    ${financial}

Checkbox validation for two checkbox
    Click Element    (${check_checkbox})[1]
    Checkbox Should Not Be Selected    ${financial}
    Wait Until Page Contains Element    ${check_checkbox}    10
    Click Element    (${check_checkbox})[2]
    Click Element    (${check_checkbox})[3]
    Checkbox Should Be Selected    ${not_interested}
    Checkbox Should Be Selected    ${stop_trading}

Checkbox validation for three checkbox
    Click Element    (${check_checkbox})[2]
    Click Element    (${check_checkbox})[3]
    Checkbox Should Not Be Selected    ${not_interested}
    Checkbox Should Not Be Selected    ${stop_trading}
    Wait Until Page Contains Element    ${check_checkbox}    10
    Click Element    (${check_checkbox})[4]
    Click Element    (${check_checkbox})[5]
    Click Element    (${check_checkbox})[6]
    Checkbox Should Be Selected    ${another_website}
    Checkbox Should Be Selected    ${not_user_friendly}
    Checkbox Should Be Selected    ${difficult_transactions}

Checkbox disabled when three reasons are chosen
    Wait Until Element Is Visible    ${check_checkbox}    10
    Checkbox Should Be Selected    ${another_website}
    Checkbox Should Be Selected    ${not_user_friendly}
    Checkbox Should Be Selected    ${difficult_transactions}
    Element Should Be Disabled    ${financial}
    Element Should Be Disabled    ${stop_trading}
    Element Should Be Disabled    ${not_interested}
    Element Should Be Disabled    ${lack_of_feature}
    Element Should Be Disabled    ${unsatisfactory_service}
    Element Should Be Disabled    ${other_reasons}

Suggestion box for sharing trading platform
    Wait Until Element Is Visible    ${trading_platform}    10
    Element Should Be Enabled    ${continue_button}
    Click Element    ${trading_platform}
    Input Text    ${trading_platform}    binary

Suggestion box for improve
    Wait Until Element Is Visible    ${improve}    10
    Element Should Be Enabled    ${continue_button}
    Click Element    ${improve}
    Input Text    ${improve}    nothing

Closing account
    Wait Until Element Is Visible    ${continue_button}    10
    Click Element    ${continue_button}
    Wait Until Element Is Visible    ${close_warning}    10
    Wait Until Element Is Visible    ${close_account_button}    10
    Click Element    ${close_account_button}

Account Close Verification
    Wait Until Element Is Visible    ${verify_account_close}    20
    Element Should Contain    ${verify_account_close}    We’re sorry to see you leave. Your account is now closed.

Account Reactivation
    Wait Until Element Is Visible    ${login_button}    20
    Wait Until Element Is Enabled    ${login_button}    20
    Click Element    ${login_button}
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    nornaleyda@besquare.com.my
    Input Password    txtPass    pavi123_Thra45
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible    ${start_trading_button}    20
    Wait Until Element Is Enabled    ${start_trading_button}    20
    Click Element    ${start_trading_button}
    Wait Until Page Contains Element    ${deposit_btn}    10

Cancel Closing Account
    Wait Until Element Is Visible    ${manage_account_setting_2}    10
    Reload Page
    Wait Until Element Is Enabled    ${manage_account_setting_2}    10
    Click Element    ${manage_account_setting_2}
    Wait Until Page Contains Element    ${close_account_link}    10
    Click Element    ${close_account_link}
    Wait Until Page Contains Element    ${close_account}    10

    Reload Page
    Wait Until Page Contains Element    ${close_my_account_button}    10
    Click Element    ${close_my_account_button}

    Wait Until Page Contains Element    ${check_checkbox}    10
    Click Element    (${check_checkbox})[1]
    Checkbox Should Be Selected    ${financial}

    Wait Until Element Is Visible    ${continue_button}    10
    Click Element    ${continue_button}
    Wait Until Element Is Visible    ${close_warning}    10
    
    Wait Until Element Is Visible    ${go_back_close_account_button}    10
    Click Element    ${go_back_close_account_button}
    
    Wait Until Element Is Visible    ${back_button}    10
    Click Element    ${back_button}
    
    Wait Until Element Is Visible    ${cancel_button_2}    10
    Click Element    ${cancel_button_2}
    
    Wait Until Element Is Visible    ${deposit_btn}    10
