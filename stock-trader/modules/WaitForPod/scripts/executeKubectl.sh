#Licensed Materials - Property of IBM
#(C) Copyright IBM Corp. 2016, 2017. All Rights Reserved.
#US Government Users Restricted Rights - Use, duplication or
#disclosure restricted by GSA ADP Schedule Contract with IBM Corp.

#!/bin/bash
namespace=$1
icpuser=$2
icppassword=$3
icpmaster=$4
kubectlCmd=${@:5}
kubectlCmd="-n $namespace $kubectlCmd"

#For AI Vision cmd lookis like 
# run  --rm -i --restart=Never usermgt --image=mycluster.icp:8500/ibmcom/powerai-vision-usermgt:1.1.2.0 -- create --user team3 --password abc123 --release vision
#/tmp/executeKubectl.sh default admin <password> mycluster.icp -n default run --rm -i --restart=Never usermgt --image=mycluster.icp:8500/ibmcom/powerai-vision-usermgt:1.1.2.0 -- list --release vision

echo Target Namespace:$namespace
echo ICP K8s credentials - ipcuser:$icpuser $icppassword $icpmaster
echo Executing kubectl $kubectlCmd
cloudargs="https://${icpmaster}:8443 -u ${icpuser} -p ${icppassword}  -n ${namespace}  --skip-ssl-validation"
echo Cloudctl args: $cloudargs
cloudctl login -a $cloudargs # https://${icpcmaster}:8443 -u ${icpuser} -p ${icppassword}  -n ${namespace}  --skip-ssl-validation
kubectl $kubectlCmd


