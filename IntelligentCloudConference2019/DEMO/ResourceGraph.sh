# summarize locations used
az graph query -q 'summarize count() by location' --subscriptions 4b0e99c8-7a07-4496-833f-416ac5b8c9ef

# summarize number of RGs
az graph query -q 'summarize Num_ResourceGroups = count(resourceGroup)' --subscriptions 4b0e99c8-7a07-4496-833f-416ac5b8c9ef

# summarize resource types per RG
az graph query -q 'summarize Num_ResourceTypes = count() by resourceGroup' --subscriptions 4b0e99c8-7a07-4496-833f-416ac5b8c9ef

# summarize resource type most used
az graph query -q "summarize count() by type| project resource=type , total=count_ | order by total desc" --output table --subscriptions 4b0e99c8-7a07-4496-833f-416ac5b8c9ef
az network public-ip create -l westus -g RG-App01 -n DEMO-PIP07
az network public-ip list --output table

# find public IPs
az graph query -q "where type =~ 'Microsoft.Network/publicIPAddresses' | project name, location, resourceGroup" --subscriptions 4b0e99c8-7a07-4496-833f-416ac5b8c9ef

# find unused public IPs
az graph query -q "where type =~ 'Microsoft.Network/publicIPAddresses' and not(isnotempty(properties.ipConfiguration)) | project name, location, resourceGroup" --subscriptions 4b0e99c8-7a07-4496-833f-416ac5b8c9ef