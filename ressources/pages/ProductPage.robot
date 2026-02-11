*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PAGE_TITLE}              css:.title
${ADD_TO_CART_BUTTON}      css:.btn_inventory:first-of-type
${CART_BADGE}              css:.shopping_cart_badge

*** Keywords ***
Vérifier Page Produits Affichée
    [Documentation]    Vérifie que la page des produits est bien affichée
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    Products

Ajouter Un Produit Au Panier
    [Documentation]    Clique sur le bouton "Add to cart" du premier produit
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}
    Click Button    ${ADD_TO_CART_BUTTON}

Vérifier Nombre Articles Panier
    [Arguments]    ${nombre_attendu}
    [Documentation]    Vérifie le nombre d'articles dans le badge du panier
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be    ${CART_BADGE}    ${nombre_attendu}
