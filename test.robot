*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Open Deriv
    # Create Webdriver    Chrome
    Open Browser    https://www.deriv.com    Chrome
    Close Browser
