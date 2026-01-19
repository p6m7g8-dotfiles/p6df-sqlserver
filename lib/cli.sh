# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::sqlserver::cli::run()
#
#  Environment:	 SA_PASSWORD
#>
######################################################################
p6df::modules::sqlserver::cli::run() {

  local now_eps=$(p6_dt_now_epoch_seconds)

  docker run -d --name "sqlserver-${now_eps}" -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=$SA_PASSWORD' -p 1433:1433 microsoft/mssql-server-linux

  p6_return_void
}
