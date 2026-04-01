# shellcheck shell=bash
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
# Function: p6df::modules::sqlserver::external::brews()
#
#>
######################################################################
p6df::modules::sqlserver::external::brews() {

  p6df::core::homebrew::cmd::brew tap microsoft/mssql-release
  p6df::core::homebrew::cli::brew::install msodbcsql # XXX: fix prompt for EULA
  p6df::core::homebrew::cli::brew::install mssql-tools

  docker pull mcr.microsoft.com/mssql/server

  p6_return_void
}

######################################################################
#<
#
# Function: words sqlserver $MSSQL_SA_PASSWORD = p6df::modules::sqlserver::profile::mod()
#
#  Returns:
#	words - sqlserver $MSSQL_SA_PASSWORD
#
#  Environment:	 MSSQL_SA_PASSWORD
#>
######################################################################
p6df::modules::sqlserver::profile::mod() {

  p6_return_words 'sqlserver' '$MSSQL_SA_PASSWORD'
}
