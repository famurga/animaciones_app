import 'package:animaciones_app/src/pages/navegacion_page.dart';
import 'package:animaciones_app/src/pages/twiter_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_Do'),
        actions: <Widget>[
          IconButton(onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  TwiterScreen() ));

          }, icon: FaIcon(FontAwesomeIcons.twitter)),
          SlideInLeft(
            from: 100,
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  Pagina1Screen() ));
                }, icon: FaIcon(FontAwesomeIcons.arrowRight)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 600),
                child: Text(
              'Titulo',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            )),
            FadeInDown(
              delay: Duration(milliseconds: 1600),
              child: Text(
                'Soy un texto pequeño',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1700),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavegacionScreen()));
          },
        ),
      ),
    );
  }
}
