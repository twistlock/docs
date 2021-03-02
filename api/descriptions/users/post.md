Adds a new user to the system.

To invoke this endpoint in the Console UI:

1. Navigate to **Manage > Authentication > Users**.
2. Click **+ Add user** and enter the user's information.
3. Click the **Save** button.

### cURL Request

The following cURL command adds a new user to Central Console.
When `authType` is set to `basic`, the curl command creates a "local" user that's managed by Console.
If you've integrated Prisma Cloud with an identity provider, set `authType` appropriately.

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

Administrators centrally manage all users, and specify who has access to which projects and which collections.
Use the `permissions` object to grant a user access to specific projects and specific collections in the project.

In Enterprise Edition (SaaS), you have a single Console

The following cURL command adds a new user to Console and grants access to project `PROJECT_NAME`.
If the `permissions` object is left unspecified, a single entry is created with `project` set to `Central Console` and collections set to `["All"]`.

```bash
$ curl 'https://<CONSOLE>/api/v1/users' \
  -k \
  -X POST \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'{
   "username":"<ID>",
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
