# Optional: Connect to Azure
# Connect-AzAccount
# Get Resource Group List
$ResourceGroups = Get-AzResourceGroup
# Get Azure Firewall List
foreach($r in $ResourceGroups){
    $fwlist = Get-AzFirewall -ResourceGroupName $r.ResourceGroupName
    # if Azure Firewall exists, stop it
    if($fwlist){
        foreach($fw in $fwlist){
            Write-Host "Stopping Azure Firewall: " $fw.Name
            # Stop an existing firewall
            $azfw = Get-AzFirewall -Name $fw.Name -ResourceGroupName $fw.resourceGroupName
            if($azfw.IpConfigurations){
                $azfw.Deallocate()
                Set-AzFirewall -AzureFirewall $azfw
            }
        }
    }
}
