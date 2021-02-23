Collections are predefined filters that let you group related resources together.
For example, containers, images, hosts.

Collections are used for scoping policy rules and segmenting data/views in the Console UI and the Prisma Cloud API.


### Endpoints with a `name` URL Parameter

For collection endpoints that require a collection name in the URL parameter, retrieve the collection name from the `GET /api/v1/collections` endpoint using the `name` key.

**Note:** Spaces are considered [unsafe characters in a URL](https://www.ietf.org/rfc/rfc1738.txt) so they must be encoded with the value `%20`.