
######################################################################
#<
#
# Function: p6df::modules::sqlserver::deps()
#
#>
######################################################################
p6df::modules::sqlserver::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-docker
  )
}
######################################################################
#<
#
# Function: p6df::modules::sqlserver::external::brew()
#
#>
######################################################################
p6df::modules::sqlserver::external::brew() {

  brew tap microsoft/mssql-release
  brew install msodbcsql # XXX: fix prompt for EULA
  brew install mssql-tools

  docker pull mcr.microsoft.com/mssql/server
}

######################################################################
#<
#
# Function: p6df::modules::sqlserver::run()
#
#>
######################################################################
p6df::modules::sqlserver::run() {

  local now_eps=$(p6_dt_now_epoch_seconds)

  docker run -d --name sqlserver-${now_eps} -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=$SA_PASSWORD' -p 1433:1433 microsoft/mssql-server-linux
}

######################################################################
#<
#
# Function: p6_sqlcmd()
#
#>
######################################################################
p6_sqlcmd() {

  sqlcmd -S localhost -U sa -P $SA_PASSWORD
}
