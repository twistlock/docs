Returns a summary count of compliance issues for the images, containers, hosts, and serverless functions in your environment, organized by day (`_id`).

The response also includes a detailed list of compliance issues for each running container and host at the time of the last scan.

This endpoint maps to the table in **Monitor > Compliance > Compliance explorer** in the Console UI.

### cURL Request

The following cURL command retrieves compliance statistics:

```bash
$ curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X GET \
  https://<CONSOLE>/api/v1/stats/compliance
```

A successful response returns a summary count of compliance issues and a detailed list of compliance issues for each running container and host.
