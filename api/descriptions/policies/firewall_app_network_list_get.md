Retrieves the lists of IPv4 addresses/IP CIDR blocks for networks in WAAS.

This endpoint maps to the table in **Defend > WAAS > Network lists** in the Console UI.

### cURL Request

The following cURL command retrieves all rules in the policy.

```
$ curl -k \
  -u <USER> \
  https://<CONSOLE>/api/v1/policies/firewall/app/network-list
```

A successful response returns the lists of IPv4 addresses/IP CIDR blocks for networks in WAAS.
