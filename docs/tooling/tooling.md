# Herramientas de Arquitectura - ChatUPB

Documentacion del proceso de creacion de los diagramas C4 usando [Structurizr](https://structurizr.com/).

## Structurizr: Servidor Local

Structurizr es una herramienta para visualizar arquitectura de software usando el modelo C4. Se ejecuta localmente para desarrollo:

```bash
brew install structurizr
structurizr local <ruta-al-workspace>
```

## Exportar Diagramas

Structurizr permite exportar diagramas en formato SVG y PNG. El dialogo de exportacion muestra todas las vistas disponibles con opciones de recorte y metadatos.

![Dialogo de exportacion con las 5 vistas de ChatUPB - opciones Crop, Download, Publish activadas](images/01-structurizr-exportar-diagramas.png)

### Archivos Exportados

Los archivos exportados se descargan al sistema local. Cada vista genera un archivo PNG y SVG.

![Archivos exportados en carpeta de descargas - SystemContext.png, SystemContext-key.png, SystemContext-key.svg](images/02-archivos-exportados.png)

## Resultado: Diagramas C4

### Vista C3 - Componentes (SVG)

El diagrama de componentes muestra los 17 componentes internos de ChatUPB con sus relaciones: arquitectura MVC, patron Mediator, capa de red TCP y persistencia SQLite.

![Diagrama C3 completo de ChatUPB en SVG - 17 componentes con flechas de dependencia](images/03-c3-componentes-svg.png)

### Workspace ChatUPB en Structurizr

La pagina principal del workspace de ChatUPB en Structurizr muestra las 5 vistas disponibles: C1 Contexto, C2 Contenedores, C3 Componentes, C3a Capa de Red, C3b Capa de Datos.

![Pagina principal de Structurizr para ChatUPB con miniaturas de las 5 vistas C4](images/04-structurizr-chatupb-home.png)

## Publicacion en GitHub

Los diagramas exportados se integran directamente en el README del repositorio de GitHub, haciendolos visibles sin necesidad de ejecutar Structurizr.

![README del repositorio en GitHub mostrando diagramas C2 Containers y C3 Components embebidos](images/05-github-readme-diagramas.png)

---

Anterior: [Uso de la Aplicacion](../app-usage/usage.md)
