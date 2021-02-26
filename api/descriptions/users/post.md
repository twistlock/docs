Adds a new user to the system.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Authentication > Users**.
2. Click **+ Add user** and enter the user's information.
3. Click the **Save** button.

### cURL Request

The following cURL command adds a new user with no permissions to the master Console:

```bash
$ curl 'https://<CONSOLE>/api/v1/users' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
   "username":"{id}",
   "password":"<PASSWORD>",
   "role":"auditor",
   "authType":"basic"   
}'
```

The following cURL command adds a new user to Console and assigns permissions.

**Note:** In this example, `<PROJECT_NAME>` must be set to the name of Console (e.g., `Central Console`).

```bash
$ curl 'https://<CONSOLE>/api/v1/users' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
   "username":"{id}",
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

The following cURL command adds a new user to a tenant project.

Before you invoke this request:

1. In the Console UI navigate to **Manage > Projects**.
2. Enable the **Use projects** setting.
3. If no project is provisioned, use the **+ Provision project** button to create a new project.
4. Retrieve a tenant project name from the table from the **Project** column.

```bash
$ curl 'https://<CONSOLE>/api/v1/users' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
   "username":"{id}",
   "password":"<PASSWORD>",
   "role":"auditor",
   "authType":"basic",
   "permissions":[
      {
         "project":"<TENANT PROJECT_NAME>"
      }
   ]   
}'
```

In this example, `collections` cannot be included because the user will inherit the permissions set in the specified tenant project.

**Note:** No response will be returned upon successful execution.
