*** Settings ***
Library           SeleniumLibrary

*** Variables ***
# Locateurs de la page Cart
${CART_TITLE}              css:.title
${CART_ITEM}               css:.cart_item
${CART_ITEM_NAME}          css:.inventory_item_name
${REMOVE_BUTTON}           xpath://button[contains(text(), 'Remove')]
${CONTINUE_SHOPPING_BTN}   id:continue-shopping
${CHECKOUT_BUTTON}         id:checkout

*** Keywords ***
Verify Cart Page Is Displayed
    [Documentation]    Vérifier que la page du panier est affichée
    Wait Until Page Contains Element    ${CART_TITLE}
    Element Text Should Be    ${CART_TITLE}    Your Cart

Verify Product In Cart
    [Arguments]    ${product_name}
    [Documentation]    Vérifier qu'un produit spécifique est dans le panier
    Wait Until Page Contains Element    ${CART_ITEM_NAME}
    Page Should Contain Element    xpath://div[@class='inventory_item_name' and text()='${product_name}']

Get Cart Item Count
    [Documentation]    Retourne le nombre d'articles dans le panier
    ${count}=    Get Element Count    ${CART_ITEM}
    RETURN    ${count}

Remove First Item From Cart
    [Documentation]    Supprimer le premier article du panier
    Click Button    ${REMOVE_BUTTON}

Continue Shopping
    [Documentation]    Retourner à la page des produits
    Click Button    ${CONTINUE_SHOPPING_BTN}

Proceed To Checkout
    [Documentation]    Continuer vers le checkout
    Click Button    ${CHECKOUT_BUTTON}
