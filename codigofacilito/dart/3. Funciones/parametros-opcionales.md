# Parámetros opcionales en funciones
El parámetro opcional lo encerramos entre []
```
int operacion(int x, [int y]) {
  return x + y;
}
```
En este caso si no pasamos el parámetro opcional nos va a generar un error, es nuestra responsabilidad validar este tipo de casos.
Podemos hacerlo de la siguiente forma:
```
int operacion(int x, [int y]) {
  if (y != null) {
    return x + y;
  } else {
    return x;
  }
}
```