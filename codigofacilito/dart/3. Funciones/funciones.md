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