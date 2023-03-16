import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vinted/PageConnexion/se_connecter.dart';


class Compte extends StatefulWidget {
  const Compte({Key? key}) : super(key: key);

  @override
  _CompteState createState() => _CompteState();
}

class _CompteState extends State<Compte> {

  TextStyle textStyle = const TextStyle( fontSize: 14);
  //definition des variables pour le controller
  final checkerDelogin = TextEditingController();
  final checkerMdp = TextEditingController();
  final checkerAdresse = TextEditingController();
  final checkerCodePostal = TextEditingController();
  final checkerVille = TextEditingController();
  final checkerDateNaissance = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';


  void modeConnect() async{

    if (_key.currentState!.validate()){
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: checkerDelogin.text, password: checkerMdp.text);
        FirebaseFirestore.instance.collection('Utilisateurs')
            .doc(FirebaseAuth.instance.currentUser!.uid.toString()).collection('Profil').doc(FirebaseAuth.instance.currentUser!.uid.toString())
            .set({
          'Login': checkerDelogin.text,
          'Password' : checkerMdp.text ,
          'Adresse' : checkerAdresse.text,
          'Code postal' : checkerCodePostal.text,
          'Ville' : checkerVille.text,
          'Date de Naissance' : checkerDateNaissance.text,
        });
      } on FirebaseAuthException catch (error) {
        errorMessage = error.message!;
      }
      showDialog(context: context, builder: (context) {
        return AlertDialog(
            contentTextStyle: textStyle,
            title: const Text('Creation de compte reussie!'),
            actions : <Widget>[
              Align(
                alignment: Alignment.center,
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: textStyle,primary: const Color(0xFF5C95A1),
                      fixedSize:  const Size(250, 45)),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Se connecter'),
                ),
              )]
        );
      });
    }
  }

  @override
  Widget build(BuildContext context){
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(textStyle: textStyle,
        primary: const Color(0xFFCD5C5C),
        fixedSize:  const Size(250, 45)
    );
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color : Color(0xFF008080),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color:Color(0xFF008080) ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF008080))
              ),
            )
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Miaged: version light de l’application Vinted',style: TextStyle(fontFamily: 'bebaskai', fontSize: 30)),
          ),
          body:
          SingleChildScrollView(

            child:Form(
              key : _key,
              child: Center(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                            style : textStyle,
                            controller : checkerDelogin,
                            validator: critereLogin,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: "Login"
                            )
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                            style : textStyle,
                            controller : checkerMdp,
                            validator: critereMdp,
                            obscureText: true,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: "Password"
                            )
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                            style : textStyle,
                            controller : checkerAdresse,
                            validator: critereAdresse,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Adresse'
                            )
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                            style : textStyle,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly],
                            controller : checkerCodePostal,
                            validator: critereCodePostal,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Code postal'
                            )
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                            style : textStyle,
                            controller : checkerVille,
                            validator: critereVille,
                            decoration:const InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Ville'
                            )
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                            style : textStyle,
                            controller : checkerDateNaissance,
                            validator: critereDateNaissance,
                            decoration:const InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                labelText: 'Date de Naissance'
                            )
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                        Text(errorMessage),
                        const SizedBox(
                          height: 35.0,
                        ),
                        ElevatedButton(
                          style: buttonStyle,
                          onPressed: modeConnect,
                          child: const Text('Creation compte'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ),

        ));
  }
}



