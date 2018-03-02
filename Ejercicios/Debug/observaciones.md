# DiplomadoiOS
Diplomado iOS Dev Lab 2018.


## Error que salía:
*** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<prueba.ViewController 0x7f9bf0f064e0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key outletText.'***	

## Observaciones:
- El proyecto tenía elementos duplicados, 2 botones y 2 textfields
- Los outlets en código estaban mal escritos
- Los actions del botón estaba mal declarados

## Solución:
- Borrar elementos repetidos de la interfaz
- Quitar referencias en los elementos de la interfaz
- Volver a referenciar los elementos de la interfaz al código
