Renews an old (unexpired) access token and returns a new token.

### cURL Request

The following curl command retrieves a new access token using an old access token:

```bash
$ curl -k \
  -H "Authorization: Bearer <OLD_ACCESS_TOKEN> \
   https://<CONSOLE>/api/v1/authenticate/renew
```