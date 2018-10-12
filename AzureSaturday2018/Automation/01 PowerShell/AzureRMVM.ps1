# Create a Windows VM using Resource Manager 
function Create-AzureRmVM(){ 
    param 
   ( 
     [string] 
     $RmProfilePath =$(throw "Parameter missing: -RmProfilePath RmProfilePath"), 
     [string] 
     $ResourceGroupName =$(throw "Parameter missing: -ResourceGroupName ResourceGroupName"), 
     [string] 
     $LocationName =$(throw "Parameter missing: -LocationName LocationName"), 
     [string] 
     $VMName =$(throw "Parameter missing: -VMName VMName"), 
     [string] 
     $VMSizeName ="Standard_DS1", 
     [string] 
     $PublisherName = 'MicrosoftVisualStudio', 
     [string] 
     $OfferName = 'Windows', 
     [string] 
     $SkusName = '10-Enterprise-N', 
     [string] 
     $UserName = 'frank', 
     [string] 
     $Password = 'Frank@12345678' 

   ) 

   Try 
   { 
      #1. Login Azure by profile or Login-AzureRmAccount 
      #Login-AzureRmAccount 
      #Save-AzureRmProfile -Path “C:\PS\azureaccount.json” 
      Write-Host "Login Azure by profile" -ForegroundColor Green    
      Select-AzureRmProfile –Path $RmProfilePath -ErrorAction Stop 

      #2. Check location 
      if(Check-AzureRmLocation -LocationName $LocationName){ 
         #3. Check resource group, if not, created it. 
         if(Check-AzureRmResourceGroup -LocationName $LocationName -ResourceGroupName $ResourceGroupName){ 
            #4. Check VM images   
            Write-Host "Check VM images $SkusName" -ForegroundColor Green     
            If(Get-AzureRMVMImageSku -Location $LocationName -PublisherName $PublisherName -Offer $OfferName -ErrorAction Stop | Where-Object {$_.Skus -eq $SkusName}){ 
                #5. Check VM 
                If(Get-AzureRmVM -Name $VMName -ResourceGroupName $ResourceGroupName -ErrorAction Ignore){ 
                    Write-Host -ForegroundColor Red "VM $VMName has already exist." 
                } 
                else{ 
                   #6. Check VM Size 
                   Write-Host "check VM Size $VMSizeName" -ForegroundColor Green   
                   If(Get-AzureRmVMSize -Location $LocationName | Where-Object {$_.Name -eq $VMSizeName}) 
                   { 
                      #7. Create a storage account 
                     $BlobURL = AutoGenerate-AzureRmStorageAccount -Location $LocationName -ResourceGroupName $ResourceGroupName 
                     If($BlobURL){ 
                       #8. Create a network interface 
                       $Nid = AutoGenerate-AzureRmNetworkInterface -Location $LocationName -ResourceGroupName $ResourceGroupName -VMName $VMName 
                       If($Nid){ 
                           Write-Host "Creating VM $VMName ..." -ForegroundColor Green  

                           #10.Set the administrator account name and password for the virtual machine. 
                           $StrPass = ConvertTo-SecureString -String $Password -AsPlainText -Force 
                           $Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($UserName, $StrPass) 

                           #11.Choose virtual machine size, set computername and credential 
                           $VM = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSizeName -ErrorAction Stop 
                           $VM = Set-AzureRmVMOperatingSystem -VM $VM -Windows -ComputerName $VMName -Credential $Cred -ProvisionVMAgent -EnableAutoUpdate -ErrorAction Stop 

                           #12.Choose source image 
                           $VM = Set-AzureRmVMSourceImage -VM $VM -PublisherName $PublisherName -Offer $OfferName -Skus $SkusName -Version "latest" -ErrorAction Stop 

                           #13.Add the network interface to the configuration. 
                           $VM = Add-AzureRmVMNetworkInterface -VM $VM -Id $Nid -ErrorAction Stop 

                           #14.Add storage that the virtual hard disk will use.  
                           $BlobPath = "vhds/"+$SkusName+"Disk.vhd" 
                           $OSDiskUri = $BlobURL + $BlobPath 
                           $DiskName = "windowsvmosdisk" 
                           $VM = Set-AzureRmVMOSDisk -VM $VM -Name $DiskName -VhdUri $OSDiskUri -CreateOption fromImage -ErrorAction Stop 

                           #15. Create a virtual machine 
                           New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VM -ErrorAction Stop 
                           Write-Host "Successfully created a virtual machine $VMName" -ForegroundColor Green   
                       } 
                     } 
                   } 
                   Else 
                   { 
                      Write-Host -ForegroundColor Red "VM Size $VMSizeName does nott exist." 
                   } 

                } 
            } 
             Else{ 
                Write-Host -ForegroundColor Red "VM images does not exist." 
            } 
         } 
      } 

   } 
   Catch 
   { 
         Write-Host -ForegroundColor Red "Create a virtual machine $VMName failed" $_.Exception.Message 
         return $false 
   } 
}