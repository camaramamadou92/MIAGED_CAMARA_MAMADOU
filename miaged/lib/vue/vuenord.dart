import 'package:flutter/material.dart';
import '../VetementsMiaged/vetement.dart'; // Importation de la classe MiagedVetements


class VueNord extends StatefulWidget {
  const VueNord({ Key? key }) : super(key: key);

  @override
  _VueNordState createState() => _VueNordState();
}

class _VueNordState extends State<VueNord> {
  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 14); // Définition du style de texte
    double width = MediaQuery.of(context).size.width; // Récupération de la largeur de l'écran
    double yourWidth = width  / 6; // Calcul de la largeur de chaque onglet en fonction de la largeur de l'écran
    return DefaultTabController(
        length: 6, // Nombre d'onglets
        child: Column(
          children:  <Widget>[
// Barre d'onglets
            Material(
                color: const Color(0xFFCD5C5C), // Couleur de fond de la barre d'onglets
                child: TabBar(
                  labelStyle: textStyle , // Style de texte des onglets
                  isScrollable: true, // Possibilité de faire défiler la barre d'onglets horizontalement
                  indicatorColor: const Color(0xFF008080), // Couleur de l'indicateur de l'onglet sélectionné
                  tabs:  [
                    SizedBox(
                      width: yourWidth,
                      child: const Tab(text:'Tous'), // Onglet "Tous"
                    ),
                    SizedBox(
                      width: yourWidth,
                      child: const Tab(text:'Costumes'), // Onglet "Costumes"
                    ),
                    SizedBox(
                      width: yourWidth,
                      child: const Tab(text:'Chemises'), // Onglet "Chemises"
                    ),
                    SizedBox(
                      width: yourWidth*1.5,
                      child: const Tab(text:'Doudoune'), // Onglet "Doudoune"
                    ),
                    SizedBox(
                      width: yourWidth*1.3,
                      child: const Tab(text:'Jeans'), // Onglet "Jeans"
                    ),
                    SizedBox(
                      width: yourWidth*1.3,
                      child: const Tab(text:'Accessoires'), // Onglet "Accessoires"
                    ),
                  ],
                )
            ),
            // Contenu de la page
            const Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  MiagedVetements( categorieVetement: null), // Affichage de tous les vêtements
                  MiagedVetements( categorieVetement: 'Costumes'), // Affichage des costumes
                  MiagedVetements( categorieVetement: 'Chemises'), // Affichage des chemises
                  MiagedVetements( categorieVetement: 'Doudoune'), // Affichage des doudounes
                  MiagedVetements( categorieVetement: 'Jeans'), // Affichage des jeans
                  MiagedVetements( categorieVetement: 'Accessoires') // Affichage des accessoires

                ],
              ),
            )
          ],
        ));
  }
}

