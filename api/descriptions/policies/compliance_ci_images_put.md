Updates the compliance policy for images built in your continuous integration (CI) pipeline.
All rules in the policy are updated in a single shot.

The policy set in this endpoint is enforced by the scanners in the Jenkins plugin and the `twistcli` command line tool.

This endpoint maps to the policy table in **Defend > Compliance > Containers and images > CI** in the Console UI.


### cURL Request

The following cURL command overwrites all rules in your current policy with a new policy that has a single rule.

To make a rule effective, we recommend specifying at least one "check", which specifies a best practice or setting to be validated by the scanner.
The checks are specified by the `condition.vulnerabilities` object and maps to the prebuilt checks shown under **Compliance actions** in the Console UI when adding a new rule.

```bash
$ curl 'https://<CONSOLE>/api/v1/policies/compliance/ci/images?project=<PROJECT_NAME>' \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
  "rules": [
    {
      "name": "<RULE_NAME>",
      "collections":[
         {
            "name":"<COLLECTION_NAME>",
         }
      ],
      "alertThreshold":{
         "disabled":false,
         "value":4
      },
      "blockThreshold":{
         "enabled":false,
         "value":0
      },
      "condition": {
         "readonly": false,
         "device": "",
         "vulnerabilities": [
         		{
         			"id": 41,
         			"block": false,
         			"minSeverity": 1
         		}
         	...
         	
         	]
      }
      
      ...
      
    }
  ],
  "policyType": "ciImagesCompliance"
  
  ...
  
}'
```

**Note:** No response will be returned upon successful execution.

