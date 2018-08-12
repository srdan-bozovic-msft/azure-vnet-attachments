param([Parameter(Mandatory=$true)][String]$subscriptionId, [Parameter(Mandatory=$true)][String]$resourceGroupName, [Parameter(Mandatory=$true)][String]$virtualNetworkName)

function Ensure-Login () 
{
    $context = Get-AzureRmContext
    If($context.Subscription -eq $null)
    {
        Login-AzureRmAccount | Out-null
    }
}

Ensure-Login

$context = Get-AzureRmContext
If($context.Subscription.Id -ne $subscriptionId)
{
    #TODO check if subscription exists
    Select-AzureRmSubscription -SubscriptionId $subscriptionId  | Out-null
}

#TODO check if vnet exists
$virtualNetwork = Get-AzureRmVirtualNetwork -ResourceGroupName $resourceGroupName -Name $virtualNetworkName

$virtualNetwork.AddressSpace.AddressPrefixes[-1]


