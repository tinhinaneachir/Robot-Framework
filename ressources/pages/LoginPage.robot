*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    id:user-name
${PASSWORD_FIELD}    id:password
${LOGIN_BUTTON}      id:login-button
${ERROR_MESSAGE_LOCATOR}    css:[data-test="error"]

*** Keywords ***
Ouvrir La Page De Connexion
    [Arguments]    ${url}    ${browser}
    [Documentation]    Ouvre le navigateur et accède à la page de connexion
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Timeout    20s

Saisir Le Nom Utilisateur
    [Arguments]    ${username}
    [Documentation]    Saisit le nom d'utilisateur dans le champ
    Input Text    ${USERNAME_FIELD}    ${username}

Saisir Le Mot De Passe
    [Arguments]    ${password}
    [Documentation]    Saisit le mot de passe dans le champ
    Input Text    ${PASSWORD_FIELD}    ${password}

Cliquer Sur Le Bouton Login
    [Documentation]    Clique sur le bouton de connexion
    Click Button    ${LOGIN_BUTTON}

Vérifier Le Message Erreur
    [Arguments]    ${message_attendu}
    [Documentation]    Vérifie que le message d'erreur est affiché
    Wait Until Element Is Visible    ${ERROR_MESSAGE_LOCATOR}
    Element Should Contain    ${ERROR_MESSAGE_LOCATOR}    ${message_attendu}

Fermer Le Navigateur
    [Documentation]    Ferme le navigateur
    Close Browser
