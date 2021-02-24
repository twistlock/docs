Adds a new user to the system.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Authentication > Users**.
2. Click **+ Add user** and enter the user's information.
3. Click the **Save** button.

### cURL Request

The following cURL command adds a new user.

```bash
$ curl 'https://<CONSOLE>/api/v1/users' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
   "username":"<USER_NAME>",
   "password":"<PASSWORD>",
   "role":"auditor",
   "authType":"basic",
   "permissions":[
      {
         "project":"<PROJECT_NAME>",
         "collections":[
            "All"
         ]
      }
   ]   
}'
```

**Note:** No response will be returned upon successful execution.
