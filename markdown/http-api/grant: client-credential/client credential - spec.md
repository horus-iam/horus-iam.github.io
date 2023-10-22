<!--
{
  "order":1,
  "title": "Client Credential - spec"
}
-->

---

# Client Credential - spec

The Client Credentials grant type is used by clients to obtain an access token outside of the context of a user.

This is typically used by clients to access resources about themselves rather than to access a user's resources.

**Base Url** : `{{horusApiBaseUrl}}`

**Endpoint** : `/v1/oauth/token`

**Method** : `POST`

**Auth required** : No


## Request

**type: body**

```json
client_id=*********&client_secret=*******&grant_type=client_credentials
```

**Request Fields Description**

| key | data-type | required | description |
|------------|--------------|-------------|-------------|
| client_id  |  string | yes | clientId which allow the execution of this endpoint |
| client_secret  |  string | yes | clientSecret related to clientId |
| grant_type  |  string | yes | use **client_credentials** |

**Request Headers Description**

| header key | header value | description |
|------------|--------------|-------------|
| content-type  |  application/x-www-form-urlencoded | required by the spec |


## Response

```json
{
  "expires_in": "3600s",
  "access_token": "eyJhbGciOiJIU***",
  "token_type": "bearer"
}
```

**Response Fields Description**


| field | data-type | description |
|------------|--------------|-------------|
| token_type  | string | bearer  |
| access_token  | string | token to be attached to any api invocation  |
| expires_in  | string | token expiration in seconds  |

**Response Headers Description**

| header key | header value | description |
|------------|--------------|-------------|
| x-horus-request-id  |  ***** | value received in request headers or a  random alphanumeric value if client don't send it|

**Response codes**

| code | description |
|------------|-------------|
| 400  | field is required.  |
| 401122  | clientId or clientScret are invalid.  |
