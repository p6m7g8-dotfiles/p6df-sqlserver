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
# Function: p6df::modules::sqlserver::external::brew()
#
#>
######################################################################
p6df::modules::sqlserver::external::brew() {

  brew tap microsoft/mssql-release
  p6df::modules::homebrew::cli::brew::install msodbcsql # XXX: fix prompt for EULA
  p6df::modules::homebrew::cli::brew::install mssql-tools

  docker pull mcr.microsoft.com/mssql/server

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::sqlserver::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::sqlserver::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_return_void
}
