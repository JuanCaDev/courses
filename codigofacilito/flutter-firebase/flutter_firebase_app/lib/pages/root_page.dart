import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/classes/auth_firebase.dart';
import 'package:flutter_firebase_app/pages/home_page.dart';
import 'package:flutter_firebase_app/pages/login_page.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key, this.authFirebase}) : super(key: key);
  final AuthFirebase authFirebase;

  @override
  State<StatefulWidget> createState() => RootPageState();

}

enum AuthStatus {
  notSignedIn,
  signedIn
}

class RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    widget.authFirebase.currentUser().then((userId) {
      setState(() {
        authStatus = userId != null ? AuthStatus.signedIn : AuthStatus.notSignedIn;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(title: 'Login', auth: widget.authFirebase, onSignIn: () => updateAuthStatus(AuthStatus.signedIn));
      case AuthStatus.signedIn:
        return HomePage(onSignIn: () => updateAuthStatus(AuthStatus.notSignedIn), authFirebase: widget.authFirebase);
    }
  }

  void updateAuthStatus(AuthStatus auth) {
    setState(() {
      authStatus = auth;
    });
  }
}