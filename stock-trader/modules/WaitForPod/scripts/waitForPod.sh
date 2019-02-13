#Licensed Materials - Property of IBM
#(C) Copyright IBM Corp. 2016, 2017. All Rights Reserved.
#US Government Users Restricted Rights - Use, duplication or
#disclosure restricted by GSA ADP Schedule Contract with IBM Corp.

#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <namespace> <vision mgmt args>"
    exit 1
fi
namespace=$1
args=$2

success="false"
#`kubectl get pods -n ${namespace} > status.txt`
status=`kubectl  -n ${namespace} kubectl run  --rm -i --restart=Never usermgt --image=mycluster.icp:8500/ibmcom/powerai-vision-usermgt:1.1.2.0 $args`
    
if [ $status == 0  ]
then
    echo $status
    echo -e "\nOK!!\n${arr[@]}"
fi
