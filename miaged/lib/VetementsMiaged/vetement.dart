import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'details.dart';


class MiagedVetements extends StatefulWidget {
  const MiagedVetements(   { Key? key ,required this.categorieVetement}) : super(key: key);
  final String? categorieVetement ;
  @override
  _MiagedVetementsState createState() => _MiagedVetementsState();
}

class _MiagedVetementsState extends State<MiagedVetements> {
  TextEditingController checkerRecherche = TextEditingController();
  // méthode qui sera appelée automatiquement au moment où l'état du widget sera initialisé
  @override
  void initState() {
    checkerRecherche.addListener(() {
      elementAffiche(); // appel de la méthode elementAffiche à chaque fois que le texte change dans le champ de recherche
    });
    super.initState();
  }
  // méthode qui permet de filtrer les éléments affichés selon le texte entré dans le champ de recherche
  elementAffiche(){
    setState(() {
      checkerRecherche.text; // met à jour l'état de l'élément en utilisant le texte du champ de recherche
    });
  }
  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 14);
    // création d'un style de bouton pour les boutons "Détails"
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(textStyle:textStyle,
        primary: const Color(0xFFCD5C5C));
    // construction de la vue
    return Column(children: [
      // champ de recherche
      TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: checkerRecherche,
        decoration: const InputDecoration(

          prefixIcon: Icon(Icons.search),
          hintText: "Rechercher un vêtement",
          contentPadding: EdgeInsets.only(left: 24.0),
          border: InputBorder.none,
        ),
      ),
      // liste des vêtements
      Expanded(
          child :StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Habits').where('Type', isEqualTo: widget.categorieVetement)
                  .snapshots(),
              builder : (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (!snapshot.hasData) {
                  return const Center(child : Text('Chargement des donnees'));
                }
                return ListView(children :
                // mapping des éléments de la liste Firestore pour les afficher dans un Card
                snapshot.data!.docs.map((QueryDocumentSnapshot<Object?> item ) {
                  if(item['titre'].toString().trim().toLowerCase().contains(checkerRecherche.text.trim().toLowerCase())){
                    return Center(
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(item['photo']),
                                title: Text(item['titre']),
                                subtitle: Text('taille : '+item['taille'] + '\nprix : ' + item['prix'].toString() + ' €'  ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Détails'),
                                    style : buttonStyle,
                                    onPressed:  () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Details(id: item.id,titre:item['titre'],photo:item['photo'],marque: item['marque'],taille:item['taille'],prix:item['prix'])),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        )
                    );
                  }
                  else{
                    return const SizedBox(height: 0);
                  }
                } ).toList()
                );
              }
          ))]);

  }


}