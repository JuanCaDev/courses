import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/classes/animal.dart';
import 'package:flutter_firebase_app/pages/animal_form_page.dart';

class CardViewAnimal extends StatelessWidget {
  Animal animal;
  BuildContext context;

  CardViewAnimal(this.animal, this.context);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FormAnimal('Editar animal', animal)));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: 144,
              width: 500,
              color: Colors.green,
              child: FadeInImage.assetNetwork(
                placeholder: "img/dart.png",
                image: animal.image,
                height: 144,
                width: 160,
              )
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7),
                    child: Icon(Icons.pets),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7),
                    child: Text(animal.name, style: TextStyle(fontSize: 18),)
                  ),
                  Padding(
                    padding: EdgeInsets.all(7),
                    child: Icon(Icons.cake),
                  ),
                  Padding(
                      padding: EdgeInsets.all(7),
                      child: Text(animal.age, style: TextStyle(fontSize: 18),)
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}