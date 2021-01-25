Updates the compliance policy for images built in your continuous integration (CI) pipeline.
All rules in the policy are updated in a single shot.

The policy set in this endpoint is enforced by the scanners in the Jenkins plugin and the `twistcli` command line tool.

This endpoint maps to the policy table in **Defend > Compliance > Containers and images > CI** in the Console UI.


### cURL Request

The following cURL command overwrites all rules in your current policy with a new policy that has a single rule.

To construct an effective rule:

* Specify at least one "check" in the `condition.vulnerabilities` object. A check is a security best practice or baseline setting which will be validated by the scanner.

	For a full list of checks, go to **Defend > Compliance > Containers and images > CI** in the Console UI and create a new rule.
All prebuilt checks and their IDs are shown under **Compliance actions**.

* Specify at one `effect` value per check. The `effect` value is a list separated by commas.

	For example, in a two-check rule, the effect value could be `alert, ignore` or in a three-check rule, the effect value could be `alert, fail, ignore`. See [Effect Parameter](#effect-parameter) for more info.

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
      "effect": "alert",
      "collections":[
         {
            "name":"All"
         }
      ],
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
	
#### Effect Parameter

The `effect` parameter is a helper for the Console UI and has no impact on the policy itself. However, we recommend you specify an `effect` parameter for each check within a rule, to ensure the policy table in the Console UI renders properly.

In the UI, these are convenience strings which enable you to quickly review the policy table and see the effect of each rule. For example, you may want to quickly find the rule that's failing/blocking your build in the CI pipeline.

To specify the supported effects for each type of check:

1. Explicitly include a check in the `condition.vulnerabilities` object
2. For each `condition.vulnerabilities[X].block`, set the value to for the desired effect type:

Effect type|`condition.vulnerabilities[X].block`
---|---
`alert`|`false`
`fail`|`true`
`ignore`|The default effect for a compliance check is ignore. Therefore, Do not include `condition.vulnerabilities[X].block` in the check and the system will assume the effect is ignore.


