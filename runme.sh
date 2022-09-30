# describe performance profile (PAO)
oc describe performanceprofile intracom-pao

# list the machine config pools
oc get mcp

# display nodes reserved for project
oc get nodes -l node-role.kubernetes.io/intracom="" --show-labels

# apply labels to enable SRIOV to Intracom nodes 
oc label node --overwrite \
	-l node-role.kubernetes.io/intracom="" \
	tme.shift.zone/sriov="" \
	tme.shift.zone/intracom=""

# display nodes with SRIOV enabled (daemonset running)
oc get pods -n openshift-sriov-network-operator -o wide -l app=sriov-network-config-daemon
