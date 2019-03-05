# FloatingActionBotton
Un botón de acción flotante de diseño de material. Se usan comunmente junto con un Scaffold
```
MaterialApp(
  title: 'Mi primera aplicación',
  home: Scaffold(
    appBar: AppBar(
      title: Text('Mi primera aplicación')
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: null,
      child: Icon(Icons.add),
    )
);
```