import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/classes/animal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FormAnimal extends StatefulWidget {
  String title;
  Animal animal;
  FormAnimal(this.title, this.animal);

  @override
  State<StatefulWidget> createState() => FormPageState();
}

class FormPageState extends State<FormAnimal> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  File galleryFile;
  String urlImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: getFormAnimal(),
      ),
    );
  }

  void initState() {
    if (widget.animal != null) {
      nameController.text = widget.animal.name;
      ageController.text = widget.animal.age;
    }
  }

  Widget getFormAnimal() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.pets),
            hintText: '¿Cual es el nombre del animal?',
            labelText: 'Nombre',
          ),
          controller: nameController,
        ),
        TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.cake),
              hintText: '¿Cual es la edad?',
              labelText: 'Edad'
          ),
          controller: ageController,
        ),
        RaisedButton(onPressed: imageSelectorGallery, child: Text('Selecciona una imagen'),
        ),
        SizedBox(
          child: showImage(),
        ),
        RaisedButton(onPressed: sendData, child: Text('Guardar'))
      ],
    );
  }

  sendData() {
    saveFirebase(nameController.text).then((_) {
      DatabaseReference db = FirebaseDatabase.instance.reference().child('Animal');
      if (widget.animal != null) {
        db.child(widget.animal.key).set(getAnimal()).then((_) {
          Navigator.pop(context);
        });
      } else {
        db.push().set(getAnimal()).then((_) {
          Navigator.pop(context);
        });
      }
    });
  }

  Map<String, dynamic> getAnimal() {
    Map<String, dynamic> data = Map();
    data['name'] = nameController.text;
    data['age'] = ageController.text;

    if (widget.animal != null && galleryFile == null) {
      data['image'] = widget.animal.image;
    } else {
      data['image'] = urlImage != null ? urlImage : "";
    }

    return data;
  }

  Future<void> saveFirebase(String imageId) async {
    if (galleryFile != null) {
      StorageReference reference = FirebaseStorage.instance.ref().child('animal').child(imageId);
      StorageUploadTask uploadTask = reference.putFile(galleryFile);
      StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
      urlImage = await downloadUrl.ref.getDownloadURL();
    }
  }

  showImage() {
    if (galleryFile != null){
      return Image.file(galleryFile);
    }
    else {
      if (widget.animal != null) {
        return FadeInImage.assetNetwork(
          placeholder: "img/dart.png",
          image: widget.animal.image,
          height: 800,
          width: 700
        );
      } else {
        return Text('Imagen no seleccionada');
      }
    }
  }

  imageSelectorGallery() async {
    galleryFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 800,
      maxWidth: 700
    );
    setState(() {
    });
  }
}