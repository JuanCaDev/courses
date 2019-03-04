# Scaffold
Implementa la estructura del diseño visual del material básico.
Es un elemento que nos da el acceso que tenemos como base de Material Design.
```
MaterialApp(
  title: 'Mi primera aplicación',
  home: Scaffold(
    appBar: AppBar(
      title: Text('Mi primera aplicación'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.email),
          onPressed: null),
        IconButton(
            icon: Icon(Icons.mic),
            onPressed: null)
      ],
    )
  ),
);
```