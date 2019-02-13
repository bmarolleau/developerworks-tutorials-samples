#Licensed Materials - Property of IBM
#(C) Copyright IBM Corp. 2016, 2017. All Rights Reserved.
#US Government Users Restricted Rights - Use, duplication or
#disclosure restricted by GSA ADP Schedule Contract with IBM Corp.

#!/bin/bash
namespace=$1
args=$@
#-- create --user team3 --password abc123 --release vision
success="false"

#`kubectl get pods -n ${namespace} > status.txt`
kubectl $args
#-n ${namespace} run  --rm -i --restart=Never usermgt --image=mycluster.icp:8500/ibmcom/powerai-vision-usermgt:1.1.2.0 $args

