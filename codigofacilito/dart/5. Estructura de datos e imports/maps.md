# Maps
Es un elemento que es parecido a las listas, lo diferente es que tiene por cada elemento tiene un key o ID.
Lo definimos de la siguiente forma:
```
main() {
  var persona = {
    "nombre": "Juan",
    "apellido": "Felizzola",
    "edad": 22
  };
}
```
Para imprimir un valor podemos acceder de la siguiente manera:
```
print(persona["nombre"]);
```
También podemos recorrerlo con forEach:
```
persona.forEach((key, value) => print("$key - $value"));
```
O guardar todos las claves o valores en una variable:
```
var keys = persona.keys;
var values = persona.values;

print("Keys: $keys");
print("Values: $values");
```