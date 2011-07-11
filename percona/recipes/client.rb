include_recipe "percona::default"

case platform
when "redhat","centos","fedora"
  package "percona-server-client"
  package "libmysqlclient-dev"

when "debian","ubuntu"
  package "Percona-Server-shared-compat"
  package "Percona-Server-client-51"
  package "Percona-Server-devel-51"
end
