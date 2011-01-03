description       "Installs and configures postgresql for clients or servers"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))

recipe            "postgresql::default", "Installs postgresql client package"
recipe            "postgresql::client", "Installs postgresql client package(s)"
recipe            "postgresql::server", "Installs postgresql server packages, templates"
recipe            "postgresql::restart", "Runtime script restarts postgresql daemon(s)."

recipe            "postgresql::adminpack", "Installs server side adminpack for pgadmin tool."
recipe            "postgresql::pgagent", "Install pgagent job control system for postgres."
recipe            "postgresql::pgpool", "Install pgpool connection pooler."
recipe            "postgresql::ripi-config", "Configure PG server for RIPI"
