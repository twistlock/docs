Checks if the Console is reachable from your network host.

### cURL Request

The following cURL command pings the Console and prints the HTTP response code:

```bash
$ curl -k \
  -s \
  -o /dev/null \
  -w "%{http_code}\n" \
  -X GET \
  https://<CONSOLE>/api/v1/_ping
```

### Response

Code|Description
---|---
`200`|Indicates the request was successful, and the Console is both alive and reachable.