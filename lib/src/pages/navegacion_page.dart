import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionScreen extends StatelessWidget {
  const NavegacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notification page'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BotonNavigation(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
      onPressed: () {
        final providerModel =
            Provider.of<_NotificationModel>(context, listen: false);
        int numero = providerModel.numero;
        numero++;
        providerModel.numero = numero;
        if (numero >= 2) {
          final controller = providerModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

class BotonNavigation extends StatelessWidget {
  const BotonNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            label: ('Bones'), icon: FaIcon(FontAwesomeIcons.bone)
            ),
        BottomNavigationBarItem(
            label: ('Notifications'),
            icon: Stack(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  //child: Icon(Icons.brightness_1,size: 8, color: Colors.redAccent,)
                  child: BounceInDown(
                    from: 10,
                    animate: numero > 0 ? true : false,
                    child: Bounce(
                      from: 20,
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              ._bounceController = controller,
                      child: Container(
                        child: Text(
                          '$numero',
                          style: TextStyle(color: Colors.white, fontSize: 7),
                        ),
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                )
              ],
            )),
        BottomNavigationBarItem(
            label: ('My Dog'), icon: FaIcon(FontAwesomeIcons.dog)),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => this._numero;

  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
    notifyListeners();
  }
}
