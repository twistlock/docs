Updates the compliance policy for images built in your continuous integration (CI) pipeline.
All rules in the policy are updated in a single shot.

The policy set in this endpoint is enforced by the scanners in the Jenkins plugin and the `twistcli` command line tool.

This endpoint maps to the policy table in **Defend > Compliance > Containers and images > CI** in the Console UI.


### cURL Request

The following cURL command overwrites all rules in your current policy with a new policy that has a single rule.

Specify at least one "check", where a check is a security best practice or baseline setting to be validated by the scanner.
Checks are specified as list in the `condition.vulnerabilities` object.

For a full list of checks, go to **Defend > Compliance > Containers and images > CI** in the Console UI and create a new rule.
All prebuilt checks and their IDs are shown under **Compliance actions**.

```bash
$ curl 'https://<CONSOLE>/api/v1/policies/compliance/ci/images' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
  "rules": [
    {
      "name": "my-rule",
      "collections":[
         {
            "name":"All"
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
         	]
      }
    }
  ],
  "policyType": "ciImagesCompliance"
}'
```

**Note:** No response will be returned upon successful execution.
