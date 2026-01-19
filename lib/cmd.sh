# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::sqlserver::cmd::sql(...)
#
#  Args:
#	... - 
#
#  Environment:	 SA_PASSWORD
#>
######################################################################
p6df::modules::sqlserver::cmd::sql() {
  shift 0

  sqlcmd -S localhost -U sa -P "$SA_PASSWORD" "$@"

  p6_return_void
}
