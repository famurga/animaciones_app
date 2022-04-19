import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwiterScreen extends StatefulWidget {
  const TwiterScreen({Key? key}) : super(key: key);

  @override
  State<TwiterScreen> createState() => _TwiterScreenState();
}

class _TwiterScreenState extends State<TwiterScreen> {

  bool activar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            activar =true;
          });
        },
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
      ),
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: activar,
            from: 30,
            duration: Duration(seconds: 1),
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 40,
            )),
      ),
    );
  }
}
