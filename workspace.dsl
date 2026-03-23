workspace "ChatUPB" "C4 Architecture - Chat Application (Universidad Privada Boliviana)" {

    !docs docs

    model {
        # --- Personas ---
        user = person "Usuario ChatUPB" "Estudiante o docente UPB que usa la aplicacion de chat" "User"
        peer = person "Contacto" "Otro usuario de ChatUPB en la misma red" "User"

        # --- Software System ---
        chatupb = softwareSystem "ChatUPB" "Aplicacion de chat peer-to-peer con interfaz Swing y base de datos local" {

            # --- Containers ---
            app = container "ChatUPB App" "Aplicacion de escritorio Java Swing empaquetada con jpackage" "Java 21 / Swing" "Desktop App" {

                # --- Entry Point ---
                main = component "ChatUPB_V2" "Punto de entrada. Inicializa la aplicacion y el look-and-feel del sistema" "Java Main Class"

                # --- Controller Layer ---
                mediador = component "Mediador" "Controlador central (patron Mediator). Coordina red, vista y persistencia. Singleton." "Java Class"
                chatsController = component "ChatsController" "Gestiona operaciones CRUD de conversaciones" "Java Class"
                contactController = component "ContactController" "Gestiona operaciones CRUD de contactos" "Java Class"

                # --- Network Layer ---
                chatServer = component "ChatServer" "ServerSocket que escucha conexiones entrantes de otros usuarios" "Java ServerSocket"
                socketClient = component "SocketClient" "Conexion de socket hacia un peer. Envia y recibe mensajes serializados" "Java Socket"
                socketListener = component "SocketListener" "Interfaz de callback para eventos de red (mensaje recibido, desconexion)" "Java Interface"

                # --- Repository Layer ---
                connectionDB = component "ConnectionDB" "Singleton. Gestiona la conexion JDBC a SQLite. Crea tablas si no existen" "Java Class"
                contactDao = component "ContactDao" "Acceso a datos de contactos (CRUD, busqueda por IP, lista negra)" "Java DAO"
                cacheContactDao = component "CacheContactDao" "Cache en memoria de contactos para acceso rapido" "Java Class"
                chatsDao = component "ChatsDao" "Acceso a datos de conversaciones y mensajes" "Java DAO"
                listaNegraDao = component "ListaNegraDao" "Acceso a datos de contactos bloqueados" "Java DAO"
                daoHelper = component "DaoHelper" "Utilidad generica para ejecutar queries y procedimientos SQL" "Java Class"

                # --- View Layer ---
                chatUI = component "ChatUI" "Ventana principal. Lista de contactos, panel de chat, envio de mensajes" "Java Swing JFrame"
                chatUIStyles = component "ChatUIStyles" "Estilos visuales, colores, fuentes y bordes personalizados" "Java Class"
                themeManager = component "ThemeManager" "Gestiona temas visuales (claro/oscuro) con paleta de colores" "Java Enum/Class"
                contactRenderer = component "ContactRenderer" "Renderizador personalizado para la lista de contactos (avatar, notificaciones)" "Java ListCellRenderer"

                # --- Message Entities ---
                message = component "Message / Mensaje" "Entidades de mensajes: Hello, Aceptar, Rechazar, Invitacion, Zumbido, CambiarTema, FijarMensaje, EliminarMensaje, MensajeUnico, etc." "Java POJOs (Lombok)"
            }

            db = container "SQLite Database" "Base de datos local en ~/Library/Application Support/ChatUPB/chat_upb.sqlite" "SQLite 3.45" "Database"
        }

        # --- System Context Relationships ---
        user -> chatupb "Envia y recibe mensajes, gestiona contactos"
        peer -> chatupb "Se conecta via socket TCP para intercambiar mensajes"

        # --- Container Relationships ---
        user -> app "Interactua via interfaz Swing"
        app -> db "Lee y escribe contactos, mensajes, conversaciones" "JDBC / SQLite"

        # --- Component Relationships ---

        # Entry point
        main -> mediador "Inicializa"
        main -> chatUI "Crea y muestra"

        # Mediador (hub central)
        mediador -> chatServer "Inicia servidor de escucha"
        mediador -> socketClient "Crea conexiones salientes a peers"
        mediador -> chatsController "Delega operaciones de chat"
        mediador -> contactController "Delega operaciones de contacto"
        mediador -> chatUI "Actualiza la vista con nuevos mensajes/eventos"

        # Controllers -> DAOs
        chatsController -> chatsDao "CRUD de conversaciones"
        contactController -> contactDao "CRUD de contactos"
        contactController -> cacheContactDao "Consulta cache"
        contactController -> listaNegraDao "Consulta lista negra"

        # DAOs -> DB utilities
        contactDao -> daoHelper "Ejecuta queries"
        chatsDao -> daoHelper "Ejecuta queries"
        listaNegraDao -> daoHelper "Ejecuta queries"
        daoHelper -> connectionDB "Obtiene conexion JDBC"
        connectionDB -> db "JDBC a SQLite"

        # Network
        chatServer -> socketClient "Acepta conexion entrante, crea SocketClient"
        socketClient -> mediador "Notifica mensajes recibidos via SocketListener"
        socketClient -> message "Serializa/deserializa mensajes"

        # View
        chatUI -> mediador "Envia acciones del usuario (enviar mensaje, agregar contacto)"
        chatUI -> chatUIStyles "Aplica estilos"
        chatUI -> themeManager "Obtiene tema activo"
        chatUI -> contactRenderer "Renderiza lista de contactos"

        # Peer communication (system level)
        socketClient -> peer "Conexion TCP directa (socket sin cifrar)"
    }

    views {
        # --- System Context ---
        systemContext chatupb "SystemContext" {
            include *
            autoLayout
            title "[C1] ChatUPB - Contexto del Sistema"
            description "Level 1: Vista general - usuarios se comunican peer-to-peer via ChatUPB"
        }

        # --- Container View ---
        container chatupb "Containers" {
            include *
            autoLayout
            title "[C2] ChatUPB - Contenedores"
            description "Level 2: Aplicacion Java Swing con base de datos SQLite local"
        }

        # --- Component View ---
        component app "Components" {
            include *
            autoLayout
            title "[C3] ChatUPB - Componentes"
            description "Level 3: Arquitectura MVC con patron Mediator, red P2P via sockets, persistencia SQLite"
        }

        # --- Filtered: Network Only ---
        component app "NetworkComponents" {
            include mediador chatServer socketClient socketListener message peer
            autoLayout
            title "[C3a] ChatUPB - Capa de Red"
            description "Level 3 filtered: Comunicacion peer-to-peer via ServerSocket y SocketClient"
        }

        # --- Filtered: Data Only ---
        component app "DataComponents" {
            include connectionDB contactDao cacheContactDao chatsDao listaNegraDao daoHelper db
            autoLayout
            title "[C3b] ChatUPB - Capa de Datos"
            description "Level 3 filtered: Persistencia local con SQLite via JDBC y patron DAO"
        }

        styles {
            element "Person" {
                shape Person
                background #E85D04
                color #ffffff
                fontSize 22
            }
            element "Software System" {
                background #F48C06
                color #ffffff
                shape RoundedBox
            }
            element "Desktop App" {
                background #FAA307
                color #1d1d1f
                shape RoundedBox
            }
            element "Database" {
                shape Cylinder
                background #6e6e73
                color #ffffff
            }
            element "Component" {
                background #fff3e0
                color #1d1d1f
            }
            element "Java Interface" {
                background #e0e0e0
                color #424245
                shape Hexagon
            }
            element "Java POJOs (Lombok)" {
                background #fce4ec
                color #1d1d1f
            }
        }
    }

}
