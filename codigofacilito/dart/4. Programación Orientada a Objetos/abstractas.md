# Clases abstractas
Nos permiten definir métodos sin comportamientos.
```
abstract class Figura {
  void calcularArea();
  void calcularPerimetro();
}
```
Si intentamos crear un objeto de esta clase nos arroja un error, ya que las clases abstractas no están hecha para crear objetos. Esta es una limitante principal.
```
main() {
  var cuadrado = new Figura(); // Error
}
```
Lo que sí podemos hacer es crear una clase heredando de la clase abstracta y definir los métodos:
```
class Triangulo extends Figura {
  @override
  void calcularArea() {
    // TODO: implement calcularArea
  }

  @override
  void calcularPerimetro() {
    // TODO: implement calcularPerimetro
  }
}

main() {
  var cuadrado = new Triangulo();
}
```
> La clase abstracta es una clase en la cuál vamos a encontrar al menos un método abstracto, y los métodos los tendremos que sobreescribir cuando hacemos la herencia.