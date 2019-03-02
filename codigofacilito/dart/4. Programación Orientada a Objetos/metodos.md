# Metodos
Para definir un método:
```
class Persona {
  String nombre;
  int edad;
  // En este caso lo declaramos void para indicar que no retorna nada
  void decirNombre() {
    print("Este es mi nombre: $nombre");
  }
}
```
Para accede a este método:
``
main() {
  var juan = new Persona();
  juan.nombre = 'Juan Felizzola';

  juan.decirNombre();
}
```
# ¿Cuál es el objetivo del método
Modificar el estado del objeto.
Modificar los valores de las propiedades.