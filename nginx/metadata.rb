maintainer        "RPX Inc."
maintainer_email  "cookbooks@rpxcorp.com"
license           "Apache 2.0"
description       "Installs and configures nginx"
version           "0.0.1"

recipe "nginx::default", "Installs nginx from source with passenger and ruby enterprise."
recipe "nginx::restart", "Restart nginx daemon."
