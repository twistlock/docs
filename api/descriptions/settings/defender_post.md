Configures the advanced settings for defenders.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Defenders > Defenders**.
2. Click **Advanced settings**.
3. Configure the settings and click the **Save** button.

### cURL Request

The following cURL command:

* Sets the local defender API port to `9998`.
* Turns on the defender `runC` proxy.
* Sets the number of days to automatically remove disconnected defenders to `4`.

```bash
$ curl 'https://<CONSOLE>/api/v1/settings/defender' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
    "disconnectPeriodDays":4,
    "listeningPort":9998,
    "runcProxyEnabled":true
}'
```

**Note:** No response will be returned upon successful execution.
