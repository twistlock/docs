Retrieves the runtime policy for an application's firewall (CNAF) rules.

This endpoint maps to the table in **Defend > WAAS > Container** in the Console UI.

### cURL Request

The following cURL command retrieves all rules in the policy.

```
$ curl -k \
  -u <USER> \
  https://<CONSOLE>/api/v1/policies/firewall/app/container
```

A successful response returns a list of runtime rules in the policy.
