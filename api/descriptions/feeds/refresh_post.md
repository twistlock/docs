Triggers the Console to refresh its data from the Intelligence Stream.

### cURL Request

The following cURL command triggers the Console to refresh its data from the Intelligence Stream.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X POST \
  https://<CONSOLE>/api/v1/feeds/offline/refresh
```

**Note:** No response will be returned upon successful execution.

