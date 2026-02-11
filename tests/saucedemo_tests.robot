*** Settings ***
Documentation     Tests d'automatisation SauceDemo
Resource        ../ressources/pages/LoginPage.robot
Resource        ../ressources/pages/ProductPage.robot
Resource        ../ressources/pages/CheckoutPage.robot
Resource       ../data/test_data.robot

Test Setup        Ouvrir La Page De Connexion    ${URL}    ${BROWSER}
Test Teardown     Fermer Le Navigateur

*** Test Cases ***
Scénario 1 - Connexion Valide
    [Documentation]    Vérifier la connexion avec des identifiants valides
    
  
    Saisir Le Nom Utilisateur    ${VALID_USERNAME}
    Saisir Le Mot De Passe        ${VALID_PASSWORD}
    Cliquer Sur Le Bouton Login
    Vérifier Page Produits Affichée

Scénario 2 - Connexion Invalide
    [Documentation]    Vérifier le message d'erreur avec un mot de passe invalide
    

    Saisir Le Nom Utilisateur    ${VALID_USERNAME}
    Saisir Le Mot De Passe        ${INVALID_PASSWORD}
    Cliquer Sur Le Bouton Login 
    Vérifier Le Message Erreur    ${ERROR_MESSAGE}

Scénario 3 - Ajout Produit Au Panier
    [Documentation]    Vérifier l'ajout d'un produit au panier
    

    Saisir Le Nom Utilisateur    ${VALID_USERNAME}
    Saisir Le Mot De Passe        ${VALID_PASSWORD}
    Cliquer Sur Le Bouton Login
    Vérifier Page Produits Affichée
    Ajouter Un Produit Au Panier
    Vérifier Nombre Articles Panier    1

Scénario 4 - Finalisation De Commande
    [Documentation]    Vérifier le processus complet de finalisation de commande
    

    Saisir Le Nom Utilisateur    ${VALID_USERNAME}
    Saisir Le Mot De Passe        ${VALID_PASSWORD}
    Cliquer Sur Le Bouton Login
    Vérifier Page Produits Affichée
    Ajouter Un Produit Au Panier
    
    Aller Au Panier
    Cliquer Sur Checkout
    Remplir Les Informations    ${PRENOM}    ${NOM}    ${CODE_POSTAL}
    Cliquer Sur Continue
    Finaliser La Commande
    Vérifier Ecran De Confirmation



Scénario 5 - Import du test de Xray
    [Documentation]    Import résulats vers Xray
    [Tags]  POEI2-1045
        Saisir Le Nom Utilisateur    ${VALID_USERNAME}
        Saisir Le Mot De Passe        ${VALID_PASSWORD}
        Cliquer Sur Le Bouton Login
        Vérifier Page Produits Affichée
        Ajouter Un Produit Au Panier
        Vérifier Ecran De Confirmation 