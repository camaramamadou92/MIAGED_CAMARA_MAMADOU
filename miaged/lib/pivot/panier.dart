import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Panier extends StatefulWidget {
  const Panier({ Key? key }) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 14);
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: textStyle, primary: const Color(0xFFCD5C5C));

    return Column(children: [
      Expanded(
          child : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Utilisateurs')// Accède à la collection "Utilisateurs"
                  .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                  .collection('Panier') // Accède à la sous-collection "Panier"
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Chargement de donnees')); // Affiche un message de chargement si les données ne sont pas encore disponibles
                }
                num totalPanier = 0; // Initialise la somme totale du panier à zéro
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: snapshot.data!.docs.map((panier) { // Parcourt chaque document de la sous-collection "Panier"
                          totalPanier += panier['prix']; // Ajoute le prix de l'article au total du panier
                          return Center(
                              child: Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: Image.network(panier['photo']), // Affiche l'image de l'article
                                      title: Text(panier['titre']), // Affiche le titre de l'article
                                      subtitle: Text('taille : ' + panier['taille'] +'\nprix : ' + panier['prix'].toString() +' €'),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        ElevatedButton(
                                          child: const Text('Supprimer'), // Affiche le bouton "Supprimer"
                                          style: style,
                                          onPressed: () {
                                            totalPanier -= panier['prix']; // Soustrait le prix de l'article du total du panier
                                            FirebaseFirestore.instance
                                                .collection('Utilisateurs') // Accède à la collection "Utilisateurs"
                                                .doc(FirebaseAuth
                                                .instance.currentUser!.uid
                                                .toString()) // Accède au document correspondant à l'utilisateur connecté
                                                .collection('Panier') // Accède à la sous-collection "Panier"
                                                .doc(panier.id) // Accède au document correspondant à l'article à supprimer
                                                .delete(); // Supprime l'article du panier
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              )
                          );
                        }).toList(),
                      ),
                    ),
                    Text("Somme totale : " + totalPanier.toString()+' €', style:const TextStyle(fontSize: 18)), // Affiche la somme totale du panier
                    const SizedBox(
                      height: 55.0,
                    )
                  ],
                );
              }))]);

  }
}