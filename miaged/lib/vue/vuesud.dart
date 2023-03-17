import 'package:flutter/material.dart';
import 'package:vinted/vue/vuenord.dart'; // Import de la vue nord
import '../pivot/panier.dart'; // Import du widget panier
import '../pivot/profil.dart'; // Import du widget profil

class VueSud extends StatefulWidget {
  const VueSud({Key? key}) : super(key: key);
  @override
  _VueSudState createState() => _VueSudState();
}
class _VueSudState extends State<VueSud> {
  int _selectedIndex = 0; // Initialisation de l'indice sélectionné pour la navigation
  static  final List<Widget> _widgetOptions = <Widget>[
    const VueNord(), // Ajout de la vue nord à la liste des options
    const Panier(), // Ajout du widget panier à la liste des options
    const Profil() // Ajout du widget profil à la liste des option
  ];

  void _onItemTapped(int index) { // Méthode appelée lorsque l'on clique sur un élément de la navigation
    setState(() {
      _selectedIndex = index; // Met à jour l'indice sélectionné
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color : Color(0xFF008080), // Thème de la barre d'application
          ),
        ),
        home:  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Miaged: version light de l’application Vinted',style: TextStyle(fontFamily: 'bebaskai', fontSize: 30)),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex), // Affiche le widget correspondant à l'indice sélectionné
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_rounded),
                label: 'Acheter',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Panier',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profil',
              ),
            ],
            currentIndex: _selectedIndex, // Indice de l'élément sélectionné dans la navigation
            selectedItemColor:const Color(0xFF008080), // Couleur de l'élément sélectionné
            onTap: _onItemTapped, // Appelle la méthode _onItemTapped lorsque l'on clique sur un élément de la navigation
          ),
        ));
  }
}







