# Herencia
La herencia es una de las propiedades principales de la Programación Orientada a Objetos.
Ejemplo:
```
class Persona {
  String nombre;
  int edad;
}

class Hombre extends Persona {}

main() {
  var juan = new Hombre();
  juan.nombre = "Juan";
  print(juan.nombre);
}
```
En este caso, al decir que 'Hombre' es una clase que extiende de 'Persona' adquiere las propiedades y además los métodos.
> Todo lo que está dentro de 'Persona' también lo tiene 'Hombre'.
