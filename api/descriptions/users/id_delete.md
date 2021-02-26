Deletes a user from the system.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Authentication > Users**.
2. In a table row, click the **Actions** button for the user to update.
3. Click the **Delete** button to open the delete confirmation window.
4. Click the **Delete User** button to delete the user.

**Note:** You can not delete the user for the current logged in account.

### cURL Request

The following cURL command deletes a specific user from the system.

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X DELETE \
  https://<CONSOLE>/api/v1/users/{id}
```

**Note:** No response will be returned upon successful execution.