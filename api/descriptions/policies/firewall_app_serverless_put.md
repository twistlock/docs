Updates an existing list of application firewall (CNAF) policies for serverless functions situated in WAAS.

To invoke this endpoint in the Console UI:

1. Navigate to the **Defend > WAAS > Serverless** page.
2. Click **+ Add rule**.
3. Enter the details for the new serverless function and click **Save**

### cURL Request

The following cURL command adds a new network list.

```bash
$ curl 'https://<CONSOLE>/api/v1/policies/firewall/app/serverless' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
  "_id": "serverlessAppFirewall",
  "rules": [
    {
      "name": "{id}",
      "previousName": "",
      "collections": [
        {
          "hosts": ["*"],
          "images": ["*"],
          "labels": ["*"],
          "containers": ["*"],
          "functions": ["*"],
          "namespaces": ["*"],
          "appIDs": ["*"],
          "accountIDs": ["*"],
          "codeRepos": ["*"],
          "clusters": ["*"],
          "name": "All"
        }
      ],
      "applicationsSpec": [
        {
          "xss": {
            "effect": "alert",
            "exceptionFields": []
          },
          "codeInjection": {
            "effect": "alert",
            "exceptionFields": []
          },
          "sqli": {
            "effect": "alert",
            "exceptionFields": []
          },
          "lfi": {
            "effect": "alert",
            "exceptionFields": []
          },
          "cmdi": {
            "effect": "alert",
            "exceptionFields": []
          },
          "body": {
            "inspectionSizeBytes": 131072
          }
        }
      ]
    }
  ],
  "minPort": 0,
  "maxPort": 0
}'
```

​**Note:** No response will be returned upon successful execution.
