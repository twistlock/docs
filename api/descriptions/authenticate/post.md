Retrieves an access token using your username and password. By default, access tokens are valid for 24 hours.

### cURL Request

The following curl command retrieves a token for user 'admin' with password 'password':

```bash
$ curl -k \
  -H "Content-Type: application/json" \
  -X POST \
  -d \
'{
   "username":"admin",
   "password":"password"
}' \
  https://<CONSOLE>/api/v1/authenticate
```