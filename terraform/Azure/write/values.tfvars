#### DUMMY EXAMPLES #####
castai_configuration = {
  delete_nodes_on_disconnect = true
  autoscaler_policies_json = {
    "enabled": true,
    "isScopedMode": false,
    "clusterLimits": {
        "enabled": false
    },
    "nodeDownscaler": {
        "enabled": true,
    },
    "spotInstances": {
        "enabled": false,
    },
    "unschedulablePods": {
        "enabled": false,
    }
    }
}