import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/classes/auth_firebase.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.auth, this.onSignIn}) : super(key: key);
  final String title;
  final AuthFirebase auth;
  final VoidCallback onSignIn;

  LoginPageState createState() => LoginPageState();
}

enum FormType {
  login,
  register
}

class LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  FormType formType = FormType.login;
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: formLogin()
          ),
        ),
      )
    );
  }

  List<Widget> formLogin() {
    return [
      padded(
        child: TextFormField(
          controller: email,
          decoration: InputDecoration(icon: Icon(Icons.person), labelText: 'Correo electrónico'),
          autocorrect: false
        )
      ),
      padded(
          child: TextFormField(
            controller: password,
            decoration: InputDecoration(icon: Icon(Icons.lock), labelText: 'Contraseña'),
            autocorrect: false,
            obscureText: true
          )
      ),
      Column(
        children: buttonWidgets()
      )
    ];
  }

  Widget padded({Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: child,
    );
  }

  List<Widget> buttonWidgets() {
    switch(formType) {
      case FormType.login:
        return [
          styleButon('Iniciar sesión', validateSubmit),
          FlatButton(
            child: Text('¿No tienes una cuenta? Registrate'),
            onPressed: () => updateFormType(FormType.register),
          )
        ];
      case FormType.register:
        return [
          styleButon('Registrar', validateSubmit),
          FlatButton(
            child: Text('¿Ya tienes cuenta? Inicia sesión'),
            onPressed: () => updateFormType(FormType.login),
          )
        ];
    }
  }

  void validateSubmit() {
    (formType == FormType.login) ? widget.auth.signIn(email.text, password.text) : widget.auth.createUser(email.text, password.text);
    widget.onSignIn();
  }

  void updateFormType(FormType form) {
    formKey.currentState.reset();
    setState(() {
      formType = form;
    });
  }

  Widget styleButon(String text, VoidCallback onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.blue,
      textColor: Colors.white,
      child: Text(text)
    );
  }
}