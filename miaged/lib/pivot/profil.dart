import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vinted/PageConnexion/se_connecter.dart';


class Profil extends StatefulWidget {
  const Profil({ Key? key }) : super(key: key);
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 14);
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(textStyle: textStyle,
        primary: const Color(0xFFCD5C5C),
        fixedSize:  const Size(250, 45)
    );
    return  Scaffold(
        body : Center(
            child:  StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Utilisateurs')
                    .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                    .collection('Profil')
                    .snapshots(),
                builder : (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (!snapshot.hasData) {
                    //Afficher un message de chargement s'il n'y a pas de données
                    return const Center(child : Text('Chargement des donnees'));
                  }
                  //Définition des contrôleurs de textes pour les champs de formulaire
                  final _key = GlobalKey<FormState>();
                  final checkerDeLogin = TextEditingController();
                  final checkerMdp = TextEditingController();
                  final checkerAdresse = TextEditingController();
                  final checkerCodePostal = TextEditingController();
                  final checkerVille = TextEditingController();
                  final checkerDateNaissance = TextEditingController();
                  return ListView(children : snapshot.data!.docs.map((profil ) {
                    // Récupération des valeurs des champs à partir de Firestore et les placer dans les champs de formulaire
                    checkerDeLogin.text = profil['Login'];
                    checkerMdp.text = profil['Password'];
                    checkerAdresse.text = profil['Adresse'];
                    checkerCodePostal.text = profil['Code postal'];
                    checkerVille.text = profil['Ville'];
                    checkerDateNaissance.text = profil['Date de Naissance'];
                    return Center(
                      child: Form(
                        key : _key,
                        child: Center(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(36.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const SizedBox(height: 45.0),
                                  TextFormField(
                                      controller : checkerDeLogin,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                          labelStyle: const TextStyle(color: Color(0xFF008080)) ,
                                          focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF008080))),
                                          hintText: profil['Login'],
                                          labelText: 'Login'
                                      )
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextFormField(
                                      controller : checkerMdp,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                          labelStyle: const TextStyle(color: Color(0xFF008080)) ,
                                          focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF008080))),
                                          hintText: profil['Password'],
                                          labelText: 'Password'
                                      )
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextFormField(
                                      controller : checkerAdresse,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                          labelStyle: const TextStyle(color: Color(0xFF008080)) ,
                                          focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF008080))),
                                          hintText: profil['Adresse'],
                                          labelText: 'Adresse'
                                      )
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly],
                                    controller : checkerCodePostal,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                        labelStyle: const TextStyle(color: Color(0xFF008080)) ,
                                        focusedBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF008080))),
                                        hintText: profil['Code postal'].toString(),
                                        labelText: 'Code postal'
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextFormField(
                                      controller : checkerVille,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                          labelStyle: const TextStyle(color: Color(0xFF008080)) ,
                                          focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF008080))),
                                          hintText: profil['Ville'],
                                          labelText: 'Ville'
                                      )
                                  ),
                                  const SizedBox(height: 25.0),
                                  TextFormField(
                                      controller : checkerDateNaissance,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                          labelStyle: const TextStyle(color: Color(0xFF008080)) ,
                                          focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF008080))),
                                          hintText: profil['Date de Naissance'],
                                          labelText: 'Date de naissance'
                                      )
                                  ),
                                  const SizedBox(
                                    height: 35.0,
                                  ),
                                  Text(errorMessage),
                                  ElevatedButton(
                                      style: buttonStyle,
                                      onPressed: (){
                                        FirebaseAuth.instance.currentUser!.updatePassword(checkerMdp.text);
                                        FirebaseFirestore.instance.collection('Utilisateurs')
                                            .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                                            .collection('Profil')
                                            .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                                            .update({
                                          'Password': checkerMdp.text,
                                          'Adresse' : checkerAdresse.text,
                                          'Code postal' : checkerCodePostal.text,
                                          'Ville' : checkerVille.text,
                                          'Date de Naissance' : checkerDateNaissance.text
                                        });
                                        errorMessage = 'Modifications enregistrées.';
                                      },
                                      child: const Text("Valider",textAlign: TextAlign.center)
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  ElevatedButton(
                                    style: buttonStyle,
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const MiagedConnect()),
                                      );
                                    },
                                    child: const Text("Se déconnecter",textAlign: TextAlign.center),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } ).toList(),
                  );
                }
            )));
  }
}