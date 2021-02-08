Updates the runtime policy for app-embedded deployments.
All rules in the policy are updated in a single shot.

This endpoint maps to the **Add rule** button in **Defend > Runtime > App-Embedded policy** in the Console UI.

### cURL Request

The following cURL command overwrites all rules in your current policy with a new policy that has a single rule.

```bash
$ curl 'https://<CONSOLE>/api/v1/policies/runtime/app-embedded' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
   "rules":[
      {
         "name":"my-rule",
         "collections":[
            {
               "name":"All"       
            }
         ],
         "processes":{
            "effect":"alert"
         },
         "network":{
            "effect":"alert",
            "blacklistIPs":[               
            ],
            "blacklistListeningPorts":[               
            ],
            "whitelistListeningPorts":[
            ],
            "blacklistOutboundPorts":[               
            ],
            "whitelistOutboundPorts":[
               {
                  "start":4312,
                  "end":4312,
                  "deny":false
               }
            ],
            "whitelistIPs":[               
            ]
         },
         "dns":{
            "effect":"prevent",
            "whitelist":[
            ],
            "blacklist":[               
            ]
         }
      }
   ]
}'
```

**Note:** No response will be returned upon successful execution.
