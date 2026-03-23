## Que es el Modelo C4?

El modelo C4 fue creado por **Simon Brown** (arquitecto de software, Jersey UK) entre 2006 y 2011, basado en UML y el modelo de vistas 4+1. Se popularizo en 2018 con el lanzamiento de [c4model.com](https://c4model.com) bajo licencia Creative Commons. Hoy lo usan miles de equipos en todo el mundo. O'Reilly publico el libro oficial en 2025.

C4 = **Context, Containers, Components, Code** - cuatro niveles de zoom para visualizar la arquitectura de software.

---

### Los 4 Niveles

| Nivel | Nombre | Que muestra | Audiencia |
|-------|--------|-------------|-----------|
| **C1** | System Context | Quien usa el sistema y con que se conecta | Todos (negocio + tecnico) |
| **C2** | Containers | Las unidades desplegables (apps, bases de datos, APIs) | Equipo tecnico |
| **C3** | Components | Los bloques internos de cada contenedor | Desarrolladores |
| **C4** | Code | Detalle a nivel de clases | Raramente usado - el codigo es la documentacion |

---

### Principios Fundamentales

1. **Zoom progresivo** - no volcar todo de una vez. Cada nivel agrega detalle para una audiencia diferente.
2. **Abstracciones reales** - los elementos mapean a cosas concretas (sistemas, contenedores, componentes), no a estereotipos UML abstractos.
3. **Diagramas autoexplicativos** - cada caja tiene nombre, tipo, tecnologia y descripcion. Sin leyendas ambiguas.
4. **Arquitectura como codigo** - los diagramas se definen en texto (DSL), versionados en git junto al codigo fuente.

---

### Structurizr

**Structurizr** es la herramienta oficial creada por Simon Brown para renderizar modelos C4 desde un DSL basado en texto.

- Sitio oficial: [structurizr.com](https://structurizr.com)
- Modelo C4: [c4model.com](https://c4model.com)
- Referencia DSL: [docs.structurizr.com/dsl/language](https://docs.structurizr.com/dsl/language)
- Instalacion: `brew install structurizr` o `docker pull structurizr/structurizr`
