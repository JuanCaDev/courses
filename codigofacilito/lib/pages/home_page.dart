import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/classes/auth_firebase.dart';
import 'package:flutter_firebase_app/pages/animal_form_page.dart';
import 'package:flutter_firebase_app/widgets/listview_animal.dart';

class HomePage extends StatelessWidget {
  HomePage({this.onSignIn, this.authFirebase});
  final VoidCallback onSignIn;
  final AuthFirebase authFirebase;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(onPressed: signOut, child: Text('Cerrar sesión'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormAnimal('Nuevo animal', null))
          );
        },
        shape: StadiumBorder(),
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add, size: 20,),
      ),
      body: ListViewAnimal(context),
    );
  }

  void signOut() {
    authFirebase.signOut();
    onSignIn();
  }

}