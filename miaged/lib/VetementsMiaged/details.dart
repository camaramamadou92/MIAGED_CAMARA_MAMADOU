import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String id;
  final String titre;
  final String photo;
  final String marque;
  final String taille;
  final int prix;
  const Details({Key? key,required this.id, required this.titre, required this.photo, required this.marque, required this.taille, required this.prix}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}
class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 14);
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(textStyle: textStyle, primary: const Color(0xFFCD5C5C),
        fixedSize:  const Size(200, 45));

    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color : Color(0xFF008080),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Miaged: version light de l’application Vinted',style: TextStyle(fontFamily: 'bebaskai', fontSize: 30)),
          ),
          body:
          Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(textStyle: textStyle, primary: const Color(0xFFCD5C5C),
                            fixedSize:  const Size(100, 45)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Retour'),
                      ),
                    ])),
                const SizedBox(height: 40),
                Text(widget.titre, style:const TextStyle(fontSize: 18)),
                const SizedBox(height: 40),
                Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            widget.photo,
                            height: 300,
                            fit:BoxFit.fitHeight
                        ),
                      ),
                      ListTile(
                        title: const Text('Description du produit : '),
                        subtitle: Text('marque :  '+ widget.marque +'\ntaille : '+ widget.taille +'. \nprix : ' + widget.prix.toString() + ' €.' ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ElevatedButton(
                            style: buttonStyle,
                            onPressed: () {
                              FirebaseFirestore.instance.collection('Utilisateurs')
                                  .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                                  .collection('Panier')
                                  .doc(widget.id)
                                  .set({
                                'titre': widget.titre,
                                'prix' : widget.prix ,
                                'marque' : widget.marque,
                                'photo' : widget.photo,
                                'taille' : widget.taille
                              });
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                    contentTextStyle: textStyle,
                                    title: const Text('Article ajouté au panier'),
                                    actions : <Widget>[
                                      Align(
                                          alignment: Alignment.center,
                                          child:
                                          ElevatedButton(
                                            style: buttonStyle,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Retour'),
                                          )
                                      )]
                                );
                              }
                              );
                            },
                            child: const Text('Ajouter au panier'),
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ]),
        )
    );
  }
}

