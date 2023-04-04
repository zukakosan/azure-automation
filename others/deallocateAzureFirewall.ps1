# Stop an existing firewall
$azfw = Get-AzFirewall -Name -ResourceGroupName <リソースグループ名>
$azfw.Deallocate()
Set-AzFirewall -AzureFirewall $azfw