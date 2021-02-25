Updates the registries to scan.
All registries to scan are updated in a single shot.

To invoke this endpoint in the Console UI:

1. Navigate to **Defend > Vulnerabilities > Images > Registry settings**.
2. Under the **Registries** table, add a registry item using **+ Add registry**
3. Click the **Save** button.

### General Set up and Scan Process

This endpoint works hand-in-hand with the `/policies` endpoints.

**To set up a registry:**

1. Add your registry account information using this endpoint or use the Console UI.

	**Note:** This is where your resources live. For example, an AWS account.

2. Prisma Cloud auto-discovers the resources in those accounts.

	* The resources are auto-discovered based on the results of the `/settings/registries` endpoint.

		For example, a container image.

3. Those resources are passed to the scanner for evaluation.
	
	* The scanner uses the corresponding `/policies` endpoints to assess the resource.

		For example, the `/policies/vulnerability/images` and `/policies/compliance/images` endpoints.

### cURL Request

Each registry to scan is specified as an item in the `specifications` array.

The critical fields for this endpoint are:

* `registry` - String specifying the registry URL.
* `credentialID` - String specifying the registry credential.
* `version` - String specifying the type of registry to scan and may be one of the following strings:

Version|Description
 ---|---
 `aws`|Amazon EC2 Container Registry
 `azure`|Azure Container Registry
 `2`|Docker Registry v2
 `dtr`|Docker Trusted Registry
 `gcr`|Google Container Registry
 `jfrog`|JFrog Artifactory
 `sonatype`|Sonatype Nexus
 `coreos`|CoreOS Quay
 `redhat`|Red Hat OpenShift
 `bluemix`|IBM Cloud Container Registry

The remaining fields (e.g., `repository`, `exclusions`, etc.) are optional.
These fields enable you to refine the scope of what Prisma Cloud auto-discovers.

**Note:** An empty registry string implicitly refers to the Docker Hub and pulls from a public repo.
The library namespace specifies a [Docker official image](https://docs.docker.com/docker-hub/official_images/).
To see the current list of Docker images, see [here](https://github.com/docker-library/official-images/tree/master/library).

#### Set up a Private Registry

Most uses cases will use a private registry.
To set this up:

* Create the credentials with the `/credentials` endpoint.
* Retrieve the credential ID from the `/credentials` endpoint.
* Create the registry setting with the recommended minimum required fields (`version`, `registry`, and `credentialID`).

#### Example cURL Request

The following cURL command overwrites all registries to scan with two new registries and configures Prisma Cloud to scan the Ubuntu 18.04 and Alpine 3.10 images in Docker Hub.

```bash
$ curl 'https://<CONSOLE>/api/v1/settings/registry' \
  -k \
  -X PUT \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -d \
  '{
    "specifications": [
      {
        "version": "2",
        "registry": "url.to.ubuntu.registry",
        "repository": "library/ubuntu",
        "tag": "18.04",
        "os": "linux",
        "cap": 5,
        "hostname": "",
        "credentialID": "ubuntuCredentialID",
        "scanners": 2
      },
      {
        "version": "2",
        "registry": "url.to.alpine.registry",
        "repository": "library/alpine",
        "tag": "3.10",
        "os": "linux",
        "cap": 5,
        "hostname": "",
        "credentialID": "alpineCredentialID",
        "scanners": 2
      }
    ]
  }'
```

**Note:** No response will be returned upon successful execution.

### Remove a Registry

To remove a registry from the list:

1. Retrieve the current list using the GET method.
2. Remove the entry from the `specifications` JSON array in the response.
3. Use the PUT method to submit the updated JSON object.

To delete all entries, submit an empty `specifications` array. For example:

```bash
curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X PUT \
  -d '{"specifications":[]}' \
  https://<CONSOLE>/api/v1/settings/registry
```
