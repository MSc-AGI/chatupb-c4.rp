# ChatUPB - C4 Architecture

C4 architecture diagrams for **ChatUPB**, a peer-to-peer chat application built as a university project at Universidad Privada Boliviana (UPB).

## What's inside

```
├── workspace.dsl          # Structurizr DSL - the source of truth
├── docs/                  # Documentation (rendered inside Structurizr)
│   ├── 01_c4_model.md     # What is C4? History, principles, links
│   └── 02_chatupb_arquitectura.md  # Tech stack, design patterns, views
└── puml/                  # PlantUML exports of all diagrams
```

## Views

| View | Level | What it shows |
|------|-------|---------------|
| [C1] Contexto del Sistema | System Context | Users and external connections |
| [C2] Contenedores | Containers | Java app + SQLite database |
| [C3] Componentes | Components | All 17 internal components (MVC + Mediator) |
| [C3a] Capa de Red | Components (filtered) | P2P networking: ChatServer, SocketClient |
| [C3b] Capa de Datos | Components (filtered) | Persistence: DAO pattern + SQLite |

## How to view

### Option 1: Structurizr local (interactive)

```bash
brew install structurizr
git clone https://github.com/MSc-AGI/chatupb-c4.rp.git
structurizr local chatupb-c4.rp
```

Then open http://localhost:8080/workspace/1

### Option 2: Structurizr online

Go to [structurizr.com/dsl](https://structurizr.com/dsl) and paste the contents of `workspace.dsl`.

### Option 3: PlantUML

The `puml/` folder contains pre-exported PlantUML files. Render with:

```bash
brew install plantuml
plantuml -tpng puml/*.puml
```

## Tech stack (ChatUPB)

- Java 21, Swing + MigLayout
- SQLite 3.45 (local)
- TCP sockets (peer-to-peer, no server)
- Maven, jpackage (macOS installer)

## Author

Architecture diagrams by Marcelo Caballero. Application by Irene Landivar (irenelandivarc1@upb.edu).
