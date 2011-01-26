
#
# Add backport repo for postgres 9.0
#

package "python-software-properties"

execute "add-apt-repository" do
 command "add-apt-repository ppa:pitti/postgresql"
end

execute "apt-get update" do
  command "apt-get -y update"
end
