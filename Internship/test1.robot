*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    http://localhost:8080/BC220/?company=CRONUS%20International%20Ltd.&dc=0
${DELAY}    2
${test}    //*[@id="commandBarItemButton156"]/span/span/span/span
${BarSearch}    //*[@id="product-menu-bar"]/button[2]/span
${BarNotification}    //*[@id="product-menu-bar"]/button[3] 
${BarSetting}    //*[@id="product-menu-bar"]/button[4]
${BarHelp}    //*[@id="product-menu-bar"]/button[5]
${BarProfile}    //*[@id="product-menu-bar"]/button[6]/span/div/div/div

*** Test Cases ***
Business Central Automation
    Open Browser    ${url}    chrome
    Location Should Be    ${url}

Switch to the iframe using its class attribute as the locator
    Sleep    ${DELAY}
    Select Frame    class=designer-client-frame

Current
    Current Frame Should Contain  class=designer-client-frame

Click Items
    Sleep    ${DELAY}
    Wait Until Page Contains Element    //*[@id="commandBarItemButton156"]/span/span/span/span    timeout=10s
    Click Element    //*[@id="commandBarItemButton156"]/span/span/span/span

Page ago Items
    Sleep    ${DELAY}
    Location Should Be    http://localhost:8080/BC220/?company=CRONUS%20International%20Ltd.&node=0000232e-1634-0000-0c10-e700836bd2d2&page=31&dc=0&bookmark=13_GwAAAAJ7BDEAMAAwADA

Click No. 1000
    Sleep    ${DELAY}
    Click Element    //*[@id="beeee"] 
   
Page ago Items 1000
    Sleep    ${DELAY}
    Location Should Be    http://localhost:8080/BC220/?company=CRONUS%20International%20Ltd.&page=30&dc=0&bookmark=13_GwAAAAJ7BDEAMAAwADA
    Page Should Contain    1000 ∙ Bicycle
    
Element
    Wait Until Element Is Visible    //*[@id="bjnee"]    timeout=10s
    ${element_text}    Get Text    //*[@id="bzyee"]
    Should Be Equal    ${element_text}    Bicycle
    Unselect Frame   




