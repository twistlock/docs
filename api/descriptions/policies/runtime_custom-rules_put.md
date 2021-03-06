Updates the runtime policy's custom rules.
All rules in the policy are updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to the **Defend > Runtime > Custom rules** page.
2. Click **+ Add rule**.
3. Enter the details for the new rule and click **Add**.

### cURL Request

The following cURL command overwrites all rules in your current policy with a new policy that has a single rule.

```bash
$ curl 'https://<CONSOLE>/api/v1/policies/runtime/custom-rules' \
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
         "advancedProtection":"alert",
         "processes":{
            "effect":"alert"
         },
         "network":{
            "effect":"disable"
         },
         "dns":{
            "effect":"disable"
         }
      }
   ]
}'
```

**Note:** No response will be returned upon successful execution.
