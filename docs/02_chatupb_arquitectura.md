## ChatUPB - Arquitectura

ChatUPB es una aplicacion de chat peer-to-peer desarrollada como proyecto universitario en la Universidad Privada Boliviana (UPB).

---

### Stack Tecnologico

| Componente | Tecnologia |
|------------|-----------|
| Lenguaje | Java 21 |
| UI | Swing + MigLayout |
| Base de datos | SQLite 3.45 (local) |
| Red | Sockets TCP (peer-to-peer) |
| Build | Maven |
| Empaquetado | jpackage (instalador macOS .pkg) |
| Logging | SLF4J + Log4j |
| Utilidades | Lombok |

---

### Patrones de Diseno

- **MVC** (Model-View-Controller) - separacion clara entre vista (ChatUI), controladores (Mediador, ChatsController, ContactController) y modelo (DAOs, entidades)
- **Mediator** - el Mediador es el hub central que coordina red, vista y persistencia
- **DAO** (Data Access Object) - acceso a datos via ContactDao, ChatsDao, ListaNegraDao con DaoHelper generico
- **Singleton** - ConnectionDB y Mediador como instancias unicas
- **Builder** - Chats y Contact usan el patron Builder (via Lombok)
- **Observer/Listener** - SocketListener como interfaz de callback para eventos de red

---

### Vistas C4 Disponibles

Navega las vistas en el panel izquierdo:

1. **[C1] Contexto del Sistema** - Usuario, ChatUPB, Contacto (peer)
2. **[C2] Contenedores** - App Java + Base de datos SQLite
3. **[C3] Componentes** - Los 17 componentes internos con sus relaciones
4. **[C3a] Capa de Red** - Comunicacion P2P: ChatServer, SocketClient, Mediador
5. **[C3b] Capa de Datos** - Persistencia: patron DAO con SQLite
