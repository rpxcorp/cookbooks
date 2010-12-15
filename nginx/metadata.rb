maintainer        "RPX Inc."
maintainer_email  "cookbooks@rpxcorp.com"
license           "Apache 2.0"
description       "Installs and configures nginx"
version           "0.0.1"

recipe "nginx", "Installs nginx from source with passenger."
recipe "nginx::restart", "Restart nginx daemon."
