import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vinted/PageConnexion/creer_compte.dart';
import 'package:vinted/vue/vuesud.dart';

// définition de classe
//cette classe définit un widget d’interface utilisateur
// de Flutter qui peut être utilisé pour se connecter à l'application
//et qui possède un état mutable pour gérer les interactions avec l’utilisateur
class MiagedConnect extends StatefulWidget {
  const MiagedConnect({Key? key}) : super(key: key);
  @override
  _MiagedConnectState createState() => _MiagedConnectState();
}

class _MiagedConnectState extends State<MiagedConnect> {
  final checkerDeLogin = TextEditingController();
  final checkerMdp = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';

  // creation d'une methode pour verifier la connexion utilisateur
  /*cette méthode est utilisée pour connecter un utilisateur
  à l’aide de Firebase et pour afficher
  les messages d’erreur en cas de connexion échouée.
  * */
  void userConnect() async{
    if (_key.currentState!.validate()){
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: checkerDeLogin.text, password: checkerMdp.text,);
        setState(() {
          errorMessage = '';
        });
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const VueSud()),
              (Route<dynamic> route) => false,
        );
      } on FirebaseAuthException catch (error) {
        setState(() {
          errorMessage = error.message!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context){
    const TextStyle textStyle = TextStyle(fontSize: 16);
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(textStyle: textStyle,
        primary: const Color(0xFFCD5C5C),
        fixedSize:  const Size(250, 45)
    );
    return MaterialApp(
        theme: ThemeData(
            primaryColor: const Color(0xFF008080),
            appBarTheme: const AppBarTheme(
              color : Color(0xFF008080),
            ),
            inputDecorationTheme: const InputDecorationTheme(
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
            body: SingleChildScrollView(
              child:
              Form(
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
                              style : textStyle,
                              controller : checkerDeLogin,
                              validator: critereLogin,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  hintText: "Login"
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
                                  hintText: "Password"
                              )
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),

                          Text(errorMessage),

                          ElevatedButton(
                            style: buttonStyle,
                            onPressed: userConnect,
                            child: const Text('Se connecter'),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          ElevatedButton(
                            style: buttonStyle,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Compte()),
                              );
                            },
                            child: const Text('S\'inscrire'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
        ));
  }
}
//définition des fonctions de verifications
// On check les différents criteres de champs
String? critereMdp(String? varMdp) {
  if(varMdp == null || varMdp.isEmpty){
    return 'Veuillez renseigner votre mot de passe.';
  }
  RegExp letterReg = RegExp(r".[A-Za-z].");
  if (!letterReg.hasMatch(varMdp)) {
    return 'Une lettre au moins dans votre mot de passe, merci!';
  }
  return null;
}
// fonction pour verifier si une variable varVille contenant une ville a été rensignée
//et renvoie un message d’erreur si elle est manquante,
// sinon elle retourne null si la ville a été fournie
String? critereVille(String? varVille) {
  if(varVille == null || varVille.isEmpty){
    return 'Veuillez renseigner une ville.';
  }
  return null;
}
String? critereLogin(String? varLogin) {
  if(varLogin == null || varLogin.isEmpty){
    return 'Veuillez renseigner votre login!.';
  }
  return null;
}
String? critereDateNaissance(String? varDateNaissance) {
  if(varDateNaissance == null || varDateNaissance.isEmpty){
    return 'votre date de naissance svp!.';
  }
  return null;
}
String? critereAdresse(String? varAdresse) {
  if(varAdresse == null || varAdresse.isEmpty){
    return 'Veuillez renseigner votre adresse.';
  }
  return null;
}
String? critereCodePostal(String? varCodePostal) {
  if(varCodePostal == null || varCodePostal.isEmpty){
    return 'Veuillez renseigner votre code postal.';
  }
  return null;
}

