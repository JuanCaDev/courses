# Declarando una función
```
primeraFuncion() {
  print("Mi primera función");
}
```
¿Podemos llamar una función dentro de otra? Si podemos hacerlo
```
primeraFuncion() {
  print("Mi primera función");
  segundaFuncion();
}
segundaFuncion() {
  print("Mi segunda función");
}
```
# Retornar elementos
> En teoria una función no es una función si no regresa un valor

En este caso se indica el tipo de dato a retornar
```
String primeraFuncion() {
  return "Esto es una cadena";
}
```
#