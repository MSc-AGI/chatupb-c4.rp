# Source Learnings - ChatUPB C4

## ChatUPB Application
- Java 21, Swing + MigLayout, SQLite 3.45, TCP P2P (no server)
- Architecture: MVC + Mediator pattern, DAO for persistence
- 17 internal components
- Packaged as macOS .pkg via jpackage (unsigned, expected for student project)
- Author: Irene Landivar (irenelandivarc1@upb.edu), UPB Bolivia

## Structurizr
- Homebrew: `brew install structurizr` (includes structurizr-mcp)
- Local server: `structurizr local PATH` (PATH = data dir with workspace.dsl)
- Custom port: `java -Dserver.port=PORT -jar structurizr.war local PATH`
- workspace.json OVERRIDES workspace.dsl - delete JSON to force DSL reload
- Clear cache: rm -rf PATH/.structurizr
- PNG export: Puppeteer headless Chrome (not CLI)
- Static HTML export: `structurizr export -f static -w workspace.dsl -o outdir`

## GitHub Docs
- docs/ folder > wiki (wiki is anti-pattern: no versioning, no PR review)
- Image naming: lowercase, hyphen-separated, sequential prefix
- Progressive disclosure: details/summary for >5 screenshots
- GitHub caches images aggressively - hard refresh needed after updates
