import 'package:flutter/material.dart';
import 'package:vinted/vue/vuenord.dart';
import '../pivot/panier.dart';
import '../pivot/profil.dart';

class VueSud extends StatefulWidget {
  const VueSud({Key? key}) : super(key: key);
  @override
  _VueSudState createState() => _VueSudState();
}
class _VueSudState extends State<VueSud> {
  int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
    const VueNord(),
    const Panier(),
    const Profil()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color : Color(0xFF008080),
          ),
        ),
        home:  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Miaged',style: TextStyle(fontFamily: 'bebaskai', fontSize: 30)),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
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
            currentIndex: _selectedIndex,
            selectedItemColor:const Color(0xFF008080),
            onTap: _onItemTapped,
          ),
        ));
  }
}







