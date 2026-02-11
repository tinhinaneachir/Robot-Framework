*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CART_ICON}              css:.shopping_cart_link
${CHECKOUT_BUTTON}        id:checkout
${FIRST_NAME_FIELD}       id:first-name
${LAST_NAME_FIELD}        id:last-name
${POSTAL_CODE_FIELD}      id:postal-code
${CONTINUE_BUTTON}        id:continue
${FINISH_BUTTON}          id:finish
${CONFIRMATION_MESSAGE}   css:.complete-header

*** Keywords ***
Aller Au Panier
    [Documentation]    Clique sur l'icône du panier
    Click Element    ${CART_ICON}

Cliquer Sur Checkout
    [Documentation]    Clique sur le bouton Checkout
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}
    Click Button    ${CHECKOUT_BUTTON}

Remplir Les Informations
    [Arguments]    ${prenom}    ${nom}    ${code_postal}
    [Documentation]    Remplit les informations de checkout
    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}
    Input Text    ${FIRST_NAME_FIELD}      ${prenom}
    Input Text    ${LAST_NAME_FIELD}       ${nom}
    Input Text    ${POSTAL_CODE_FIELD}     ${code_postal}

Cliquer Sur Continue
    [Documentation]    Clique sur le bouton Continue
    Click Button    ${CONTINUE_BUTTON}

Finaliser La Commande
    [Documentation]    Clique sur le bouton Finish
    Wait Until Element Is Visible    ${FINISH_BUTTON}
    Click Button    ${FINISH_BUTTON}

Vérifier Ecran De Confirmation
    [Documentation]    Vérifie que l'écran de confirmation est affiché
    Wait Until Element Is Visible    ${CONFIRMATION_MESSAGE}
    Element Text Should Be    ${CONFIRMATION_MESSAGE}    Thank you for your order!
