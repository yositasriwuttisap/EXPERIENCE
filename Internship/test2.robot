*** Settings ***
Library    SeleniumLibrary
 
*** Variables ***
${url}    http://localhost:8080/BC220/?company=CRONUS%20International%20Ltd.&page=30&dc=0&bookmark=13_GwAAAAJ7BDEAMAAwADA
${DELAY}    5

*** Test Cases ***
Business Central Automation
    Open Browser    ${url}    chrome
    Location Should Be    ${url}

Switch to the iframe using its class attribute as the locator
    Sleep    ${DELAY}
    Select Frame    class=designer-client-frame

Current
    Current Frame Should Contain  Dynamics 365 Business Central

Click
    Sleep    ${DELAY}
    Click Element    id=b5o

Check Page
    Sleep    ${DELAY}
    Page Should Contain    Posting Details 
    Page Should Contain    Cost Details

Check Id Value   
    Select Frame    class=designer-client-frame
    Wait Until Page Contains Element    id=b7wee    timeout=10s
    ${element_text}    Get Text    id=b7wee
    Should Be Equal    ${element_text}    Bicycle
     

Check Id Value2  
    Element Text Should Be    id=b7wee    Bicycle
    Unselect Frame  