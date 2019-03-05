# BottomNavigationBar
Un widget de material que se muestra en la parte inferior de una aplicación para seleccionar entre un pequeño número de vistas, generalmente entre tres y cinco.

> Esto es muy implementado por los desarrolladores que viene de Android

Esta barra de navegación inferior generalmente se usa junto con un Scaffold.
Es muy sencillo implementarlo:
```
MaterialApp(
  title: 'Mi primera aplicación',
  home: Scaffold(
    appBar: AppBar(
      title: Text('Mi primera aplicación')
    ),
    bottomNavigationBar: BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.print),
        title: Text('Imprimir')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.send),
        title: Text('Enviar')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.adjust),
        title: Text('Ajustar')
      )
    ], onTap: (int i) => debugPrint("Elemento $i")),
  ),
);
```