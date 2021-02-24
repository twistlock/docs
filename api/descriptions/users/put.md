Updates an existing user in the system.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Authentication > Users**.
2. In a table row, click the **Actions** button for the user to update.
3. Click the **Manage** button and update the user's parameters.
4. Click the **Save** button to save the updated user.

### cURL Request

The following example command changes the role of a user to `auditor`:

```bash
$ curl 'https://<CONSOLE>/api/v1/users' \
  -k \
  -X PUT \
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
