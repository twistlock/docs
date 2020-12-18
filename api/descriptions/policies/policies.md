Policies are sets of ordered rules.
[Rule order](https://docs.twistlock.com/docs/latest/configure/rule_ordering_pattern_matching.html) determines how a policy is evaluated.

You can manage your rules and policies programmatically using the policy API endpoints.

### How to Update Policies

All of the `PUT /api/v1/policies/*` endpoints work similarly. 

To add, edit, or remove vulnerability rules from a policy:

1. Retrieve the entire policy, which includes all the vulnerability rules using the `GET` endpoint.

  For example, the following cURL command uses basic auth to retrieve a list of all image vulnerability rules, pretty-prints the JSON response, and saves the results to a `vulnerability_rules.json` file.

   ```bash
   $ curl -k \
     -u <USER> \
     https://<CONSOLE>/api/v1/policies/runtime/host \
     | jq '.' > vulnerability_rules.json
   ```

2. Modify the saved JSON with the updates, including any new rule insertions. **Note:** Rule order is important.

3. Update the rules by pushing the new JSON payload into the `PUT` endpoint.

   For example, the following cURL command installs the rules defined in your `vulnerability_rules.json` file.
   
   **Note:** Remember to specify the `@` symbol.

   ```bash
   $ curl -k \
     -u <USER> \
     -X PUT \
     -H "Content-Type:application/json" \
     https://<CONSOLE>:8083/api/v1/policies/runtime/host \
     --data-binary "@vulnerability_rules.json"
   ```

Any previously installed rules are overwritten.

### How to Delete Policies

In general, the policy endpoints don't have `DELETE` methods. Use the `PUT` method to delete all rules by submitting an empty JSON object.

For example, to delete all host runtime rules:

```
curl -k \
  -u <USER> \
  -H 'Content-Type: application/json' \
  -X PUT \
  -d '{}' \
  https://<CONSOLE>/api/v1/policies/runtime/host
```