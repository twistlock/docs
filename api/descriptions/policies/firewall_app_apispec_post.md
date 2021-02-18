Imports endpoints into a WAAS app from an OpenAPI/Swagger API specification.

To invoke this endpoint in the Console UI:

1. Navigate to the **Defend > WAAS > App-Embedded** page.
2. Click **Add rule**.
3. Enter the details for the new rule and click **Add new app**
4. On the **App definition** tab, click the **Import** button.

### cURL Request

The following cURL command imports an API specification.

Ensure you replace `<Swagger/OpenAPI spec>` with your Swagger or OpenAPI specification.

```bash
$ curl 'https://<CONSOLE>/api/v1/policies/firewall/app/apispec' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'<Swagger/OpenAPI spec>'
```

A successful response returns information about the API specification that was imported.
