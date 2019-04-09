# summarize locations used
az graph query -q 'summarize count() by location' 

# summarize number of RGs
az graph query -q 'summarize Num_ResourceGroups = count(resourceGroup)' 

# summarize resource types per RG
az graph query -q 'summarize Num_ResourceTypes = count() by resourceGroup' 

# summarize resource type most used
az graph query -q "summarize count() by type| project resource=type , total=count_ | order by total desc" --output table 
az network public-ip create -l westus -g RG-App01 -n DEMO-PIP07
az network public-ip list --output table

# find public IPs
az graph query -q "where type =~ 'Microsoft.Network/publicIPAddresses' | project name, location, resourceGroup" 

# find unused public IPs
az graph query -q "where type =~ 'Microsoft.Network/publicIPAddresses' and not(isnotempty(properties.ipConfiguration)) | project name, location, resourceGroup" 