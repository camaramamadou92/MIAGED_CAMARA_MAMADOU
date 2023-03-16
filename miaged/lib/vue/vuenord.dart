import 'package:flutter/material.dart';
import '../VetementsMiaged/vetement.dart';


class VueNord extends StatefulWidget {
  const VueNord({ Key? key }) : super(key: key);

  @override
  _VueNordState createState() => _VueNordState();
}

class _VueNordState extends State<VueNord> {
  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(fontSize: 14);
    double width = MediaQuery.of(context).size.width;
    double yourWidth = width  / 6;
    return DefaultTabController(
        length: 6,
        child: Column(
          children:  <Widget>[

            Material(
                color: const Color(0xFFCD5C5C),
                child: TabBar(
                  labelStyle: textStyle ,
                  isScrollable: true,
                  indicatorColor: const Color(0xFF008080),
                  tabs:  [
                    SizedBox(
                      width: yourWidth,
                      child: const Tab(text:'Tous'),
                    ),
                    SizedBox(
                      width: yourWidth,
                      child: const Tab(text:'Costumes'),
                    ),
                    SizedBox(
                      width: yourWidth,
                      child: const Tab(text:'Chemises'),
                    ),
                    SizedBox(
                      width: yourWidth*1.5,
                      child: const Tab(text:'Doudoune'),
                    ),
                    SizedBox(
                      width: yourWidth*1.3,
                      child: const Tab(text:'Jeans'),
                    ),
                    SizedBox(
                      width: yourWidth*1.3,
                      child: const Tab(text:'Accessoires'),
                    ),
                  ],
                )
            ),
            const Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  MiagedVetements( categorieVetement: null),
                  MiagedVetements( categorieVetement: 'Costumes'),
                  MiagedVetements( categorieVetement: 'Chemises'),
                  MiagedVetements( categorieVetement: 'Doudoune'),
                  MiagedVetements( categorieVetement: 'Jeans'),
                  MiagedVetements( categorieVetement: 'Accessoires')
                ],
              ),
            )
          ],
        ));
  }
}

