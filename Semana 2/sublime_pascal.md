# Usar Pascal en SublimeText

Durante las asesorías podrán ver que no usaré ningún entorno específico para Pascal, sino que estaré programando en SublimeText.
Para aclarar dudas de cómo lo he hecho, aquí dejo una mini guía para emular mis resultados.

**1. Descargar e instalar SublimeText y Freepascal**

* [SublimeText](https://www.sublimetext.com/3)

* [FreePascal](https://www.freepascal.org/download.html)

**2. Configurar la variables de entorno de FreePascal**

- Ir a equipo > propiedades
- Configuración avanzada del sistema
- Variables de Entorno.
- Nueva variables para usuario.
- Colocar como nombre "fpc" y como valor la dirección donde instalaste el compilador. Ejemplo: "C:\FPC\3.0.4\bin\i386-Win32\fpc.exe"
- Aceptar todo.

**3. Configurar el build system de SublimeText**

- Ir a Tools.
- Build System.
- New Build System.
- Copiar y pegar el siguiente script, buscar uno por internet o crear uno propio.
```json
{
    "cmd": ["fpc", "${file_path}/${file_base_name}"],
    "selector": "source.pascal",
    "variants": [
        {
            "cmd": ["start", "cmd", "/c", "$file_base_name.exe & pause"],
            "name": "Run",
            "shell": true
        }
    ]
}
```
- Guardar en la carpeta por defecto de SublimeText con el deseado.

**4. Crear un proyecto**

- Crear un proyecto cualquiera.
- Guardarlo con la extensión ".pas".
- Guardar siempre antes de compilar.
- Ctrl + Shift + B y seleccionar Pascal (para compilar).
- Ctrl + Shift + B y seleccionar Pascal - Run (para abrir la consola).

(NOTA: existen distintas posibilidades para compilar y correr un proyecto, todo depende del script de Build System que elijas.
