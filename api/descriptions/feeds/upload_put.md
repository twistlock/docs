Uploads an Intelligence Stream.

### cURL Request

The following cURL command triggers the Console to upload an Intelligence Stream:

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X PUT \
  https://<CONSOLE>/api/v1/feeds/offline/{id}
```

**Note:** No response will be returned upon successful execution.

