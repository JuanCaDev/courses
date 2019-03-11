import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/classes/animal.dart';
import 'package:flutter_firebase_app/widgets/cardview_animal.dart';

class ListViewAnimal extends StatefulWidget {
  BuildContext context;

  ListViewAnimal(this.context);

  @override
  State<StatefulWidget> createState() => ListViewAnimalState();
}

class ListViewAnimalState extends State<ListViewAnimal> {
  List<Animal> animals = List();
  DatabaseReference reference = FirebaseDatabase.instance.reference().child('Animal');
  StreamSubscription<Event> onAddedSubs;
  StreamSubscription<Event> onChangeSubs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder( // Para que se actualice automatiamente
      shrinkWrap: true, // Para que se adapte al contenido
        itemCount: animals.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ObjectKey(animals[index]),
          child: CardViewAnimal(animals[index], context),
          onDismissed: (direction) => deleteItem(index),
        );
      }
    );
  }

  void deleteItem(index) {
    setState(() {
      reference.child(animals[index].key).remove();
      animals.removeAt(index);
    });
  }

  void initState() {
    onAddedSubs = reference.onChildAdded.listen(onEntryAdded);
    onChangeSubs = reference.onChildChanged.listen(onEntryChanged);
  }

  onEntryAdded(Event event) {
    setState(() {
      animals.add(Animal.getAnimal(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    Animal oldEntry = animals.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      animals[animals.indexOf(oldEntry)] = Animal.getAnimal(event.snapshot);
    });
  }

  void disponse() {
    onAddedSubs.cancel();
    onChangeSubs.cancel();
  }
}