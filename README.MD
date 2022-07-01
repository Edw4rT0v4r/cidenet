# PRUEBA TÉCNICA CIDENET

## Especificación técnica y de arquitectura

El desarrollo de esta prueba técnica fue construido utilizando `PHP` versión `8.1.7`,
implementando el framework `Laravel` en su versión `^9.19` utilizando un poco
`Arquitectura Hexagonal` mediante `Domain Driven Design`, dando cómo producto final,
una `API` para el `CRUD` de empleados de la empresa `Cidenet`.

También se construye un proyecto en `Next.js` para consumir dicha `API`

## Cómo compilar y correr los proyectos

El proyecto está dockerizado, y para su fácil ejecución en entornos Unix se ha escrito un makefile

| Paso |                               Comando                               |                                                                                              Descripción                                                                                              |
|:----:|:-------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  1   |                             `git clone`                             |                                                               Clonar este proyecto que contiene los proyectos que almacenan el código.                                                                |
|  2   |                     `make download-submodules`                      |                                                                   Descarga en código de cada proyecto para que el sistema funcione.                                                                   |
|  3   |                              `make up`                              |                                                                                Crea los contenedores y los inicializa.                                                                                |
| 3.1  |                             `make stop`                             |                                                                             Para los contenedores que se están ejecutando                                                                             |
| 3.2  |                            `make start`                             |                                                               Inicializa de nuevo los contenedores que ya se crearon para este proyecto                                                               |
|  4   |                         `make install-all`                          |                                                                       Instala las dependencias necesarias para ambos proyectos                                                                        |
|  5   |                                 ``                                  |                                           El sistema trabaja con un `virtual host` para el `backend` s importante definir la ruta en su archivo de host ***                                           |
|  6   | `make composer ACTION=run-script PACKAGE=post-root-package-install` |                                    Este comando nos crea una copia de `.env.example` en `.env` para que el sistema funcione y se pueda conectar a la base de datos                                    |
|  7   |                           `make db-fake`                            | Este comando nos permite tener 50 registros en la DB para ver cómo trabaja el sistema NOTA: si no desea tener datos fake puede correr el comando `make migration` que sólo le creará la base de datos |
|  8   |                         `make serve-front`                          |                                           Construirá la version de producción del `Front` aparte que ejecutara un servidor para verificar su funcionamiento                                           |

***
* `127.0.0.1 cidenet.api.local ***`

## Cómo compilar los test

El proyecto está dockerizado, y para su fácil ejecución en entornos Unix se ha escrito un makefile

| Paso |   Comando   |            Descripción            |
|:----:|:-----------:|:---------------------------------:|
|  1   | `make test` | Corre los test escritos en la API |
