# Start a firewall
$azfw = Get-AzFirewall -Name -ResourceGroupName <リソースグループ名>
$vnet = Get-AzVirtualNetwork -ResourceGroupName <リソースグループ名> -Name <仮想ネットワーク名>
$publicip = Get-AzPublicIpAddress -Name <パブリック IP リソース名> -ResourceGroupName <リソースグループ名>
$azfw.Allocate($vnet,$publicip)
Set-AzFirewall -AzureFirewall $azfw