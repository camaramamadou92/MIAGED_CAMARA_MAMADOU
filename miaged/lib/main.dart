import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vinted/PageConnexion/se_connecter.dart';
import 'firebase_options.dart';

// Fonction asynchrone pour initialiser Firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialisation de Flutter
// Initialisation de Firebase
await Firebase. initializeApp(
options : DefaultFirebaseOptions.currentPlatform, // Options de Firebase
);
  runApp(const MyApp()); // Lancement de l'application
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIAGED: ', // Titre de l'application
      theme: ThemeData(
        primaryColor: const Color(0xFF7A008A), // Couleur principale de l'application
      ),
      home: const MiagedConnect(), // Page de connexion par défaut
      //home: const MiagedVetements,
    );
  }
}

