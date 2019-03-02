# Constructor
Nos permite ejecutar instrucciones antes de crear el objeto.
Definimos el constructor:
```
class Persona {
  String nombre;
  int edad;

  // Normalmente le pasamos por parámetros las propiedades de la clase
  Persona(String nombre, int edad) {
    // Igualamos las propiedades de la clase con los parámetros del constructor
    this.nombre = nombre;
    this.edad = edad;
  }

  void decirNombre() {
    print("Este es mi nombre: $nombre");
  }
}
```
Esto nos facilita la creación de varias instancias de la misma clase:
```
main() {
  var juan = new Persona("Juan", 20);
  var carlos = new Persona("Carlos", 30);
}
```
Una forma más fácil de declarar el mismo constructor es:
class Persona {
  String nombre;
  int edad;

  Persona(this.nombre, this.edad);
}