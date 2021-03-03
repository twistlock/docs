Updates the code repositories (scopes) to scan.
The list of code repositories to scan is updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to **Defend > Vulnerabilities > Code repositories**.
2. Under the **GitHub repositories scan scope** table, add a scope item using **+ Add scope**
  
  **Note:** If your table is not present add an item to the table by clicking **Add the first item**.

3. Click the **Save** button.

### General Set up and Scan Process

This endpoint works hand-in-hand with the `/policies` endpoints.

**To set up a code repository for scanning:**

1. Add your code repository account information using this endpoint.

   For example, specify the code repository name(s) and credentials of your GitHub account.

2. Prisma Cloud auto-discovers the code repositories specified with this endpoint.

   The system invokes the GET `/coderepos/discover` endpoint to discover the available repositories using the credential ID provided.

3. The list of auto-discovered code repositories is passed to the scanner for evaluation.
  
   The scanner uses the corresponding `/policies/vulnerability/coderepos` endpoint to assess each code repository.

### cURL Request

Each code repository scope item is specified as an element within the endpoint's payload array. The repositories for each scope are specified within the scope's `repositories` array.

The critical fields for this endpoint are:

* `repositories` - Repository names to scan. The format is \<owner\>/\<repo_name\>.
* `type` - Type of provider for the code repository (e.g. `github` or `CI`).
* `credentialID` - ID of the credentials in the credentials store to authenticate against the service provider.
* `id` - ID of an existing code repository to update.

The following cURL command overwrites all code repository scopes to scan with a new single code repository scope.

```bash
$ curl 'https://<CONSOLE>/api/v1/settings/coderepos' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
'[
   {
      "type":"github",
      "publicOnly":false,
      "credentialID":"<CREDENTIAL_ID>",
      "repositories":[
         "test23"
      ],
      "excludedManifestPaths":[
         "path1"
      ],
      "explicitManifestNames":[
         "path"
      ],
      "targetPythonVersion":"3.7"
   }
]'
```

**Note:** No response will be returned upon successful execution.
