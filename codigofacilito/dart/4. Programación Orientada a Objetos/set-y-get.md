# Set y Get
Son métodos que usamos en las clases para mostrar (get) o modificar (set) el valor de un atributo.
Se definen de la siguiente manera:
```
class Persona {
  String nombre;
  int edad;

  String getNombre {
    return this.nombre;
  }
  void setNombre(String valor) {
    this.nombre = valor;
  }
}
```
Estos se utilizan sobre todo para personalizar la forma de mostrar o modificar el valor de un atributo
#
Una forma más fácil de declarar los Set y Get:
```
class Persona {
  String nombre;
  int edad;

  String getNombre => nombre;
  void setNombre(String valor) => nombre = valor;
}
```