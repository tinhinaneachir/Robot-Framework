*** Settings ***
Documentation     Tests d'automatisation SauceDemo
Resource        ../ressources/pages/LoginPage.robot
Resource        ../ressources/pages/ProductPage.robot
Resource        ../ressources/pages/CheckoutPage.robot
Resource       ../data/test_data.robot

Test Setup        Ouvrir La Page De Connexion    ${URL}    ${BROWSER}
Test Teardown     Fermer Le Navigateur


*** Test Cases ***
Scénario 1 - Import result xray
    [Documentation]    Import résulats vers Xray
    [Tags]  POEI2-1045
        Saisir Le Nom Utilisateur    ${VALID_USERNAME}
        Saisir Le Mot De Passe        ${VALID_PASSWORD}
        Cliquer Sur Le Bouton Login
        Vérifier Page Produits Affichée
        Ajouter Un Produit Au Panier
        Vérifier Ecran De Confirmation 