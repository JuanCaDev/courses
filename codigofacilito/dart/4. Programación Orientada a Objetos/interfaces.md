# Interfaces
Se definen igual que las clases abstractas:
```
abstract class MiInterface {
  void calcularArea();
  void calcularPerimetro();
  int operacion() {
    return 10;
  }
}
```
No hay diferencia entre escribir una clase abstracta o una interface, la diferencia se nota cuando la usamos:
### Clase abstracta
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
```
### Interface
class Triangulo implements Figura {
  @override
  void calcularArea() {
    // TODO: implement calcularArea
  }
  @override
  void calcularPerimetro() {
    // TODO: implement calcularPerimetro
  }
  @override
  void operacion() {
    // TODO: implement operacion
    return null;
  }
}
```
Aquí vemos que cuando vamos a usar la interface usamos la palabra 'implements'; además notamos que cuando usamos interfaces hay que sobreescribir todos los métodos creados en la clase principal, a diferencia de cuando usamos 'extends' que solo sobreescribimos los métodos que no están definidos.