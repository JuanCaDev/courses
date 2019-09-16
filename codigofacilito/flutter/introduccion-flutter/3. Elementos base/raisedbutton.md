# RaisedButton
Un diseño de material "botón levantado".
Si la devolución de llamada onPressed es nula, entonces el botón se desactivará y, por defecto, se parecerá a un botón plano en el color deshabilitado. Si se intenta cambiar el color del botón y no tiene ningún efecto; a menos de que onPressed no esté nulo.
```
RaisedButton(
  child: Text('Enviar'),
  onPressed: () => debugPrint('Click'),
  color: Colors.amberAccent,
  splashColor: Colors.blue,
)
```