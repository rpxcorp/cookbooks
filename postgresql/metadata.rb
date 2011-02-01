description       "Installs and configures postgresql for clients or servers"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))

recipe            "postgresql::default", "Installs postgresql client package"
recipe            "postgresql::client", "Installs postgresql client package(s)"
recipe            "postgresql::server", "Installs postgresql server packages, templates"
recipe            "postgresql::restart", "Runtime script restarts postgresql daemon(s)."

recipe            "postgresql::backport-9", "Installs backport for postgres 9.0."
recipe            "postgresql::contrib", "Installs server side community contributions."
recipe            "postgresql::pgagent", "Install pgagent job control system for postgres."
recipe            "postgresql::pgpool", "Install pgpool connection pooler via apt."
recipe            "postgresql::pgpool-II", "Install pgpool-II connection pooler from source."
recipe            "postgresql::ripi-config", "Configure PG server for RIPI"
recipe            "postgresql::slave", "Prep host as streaming replication slave."
recipe            "postgresql::slony", "Install Slony replication."
recipe            "postgresql::statspack", "Install PG statspack."
recipe            "postgresql::oracle-compat", "Install Orafce Oracle compat utils."

attribute "postgresql/version",
  :display_name => "Postgres Version",
  :description => "Determines which version of Postgres will be installed.",
  :required => "optional",
  :default => "8.4",
  :recipes => [ "postgresql::server", ]
