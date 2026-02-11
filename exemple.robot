*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close Browser


*** Variables ***
${monURL}    http://www.saucedemo.com/
${result}    


*** Test Cases ***
Login avec données valides et invalides
    [Template]    Vérifier login
    tomsmith     SuperSecretPassword!    fail
    wronguser    admin123    Fail
    admin    wrongpass    Fail
    
  
*** Keywords ***

Vérifier login

    [Arguments]    ${username}    ${password}    ${expected_result}
    Input Text    id=username    ${username}
    Input Text    id=password    ${password}
    Click Button    xpath=//button[@type='submit']



   


