import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vinted/PageConnexion/se_connecter.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

await Firebase. initializeApp(
options : DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIAGED: ',
      theme: ThemeData(
        primaryColor: const Color(0xFF7A008A),
      ),
      home: const MiagedConnect(),
      //home: const MiagedVetements,
    );
  }
}

