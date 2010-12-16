maintainer        "resque"
maintainer_email  "sysadmins@37signals.com"
description       "Configures Resque"
version           "0.1"
depends           "bluepill"

recipe "resque::default", "Installs resque package."
recipe "resque::server", "Configures resque server."
recipe "resque::workers", "Configures resque workers."
