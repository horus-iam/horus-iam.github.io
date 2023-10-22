<!--
{
  "order":2,
  "title": "Client Credential - non spec"
}
-->

---

# Client Credential - non spec

The Client Credentials grant type is used by clients to obtain an access token outside of the context of a user.

This is typically used by clients to access resources about themselves rather than to access a user's resources.

Note: This endpoint don't comply the oauth2 specification

**Base Url** : `{{horusApiBaseUrl}}`

**Endpoint** : `/v1/nonspec/oauth2/auth/server`

**Method** : `POST`

**Auth required** : No


## Request

**type: body**

```json
{
"grantType":"client_credentials",
"clientId":"6f7503fc-2cc1-4cf1-b45c-e50f324bf8ca.library.apps",
"clientSecret":"b3209806-42da-402d-92dc-ab2f3ef8608b"
}
```

**Request Fields Description**

| key | data-type | required | description |
|------------|--------------|-------------|-------------|
| clientId  |  string | yes | clientId which allow the execution of this endpoint |
| clientSecret  |  string | yes | clientSecret related to clientId |
| grantType  |  string | yes | use **client_credentials** |

**Request Headers Description**

| header key | header value | description |
|------------|--------------|-------------|
| content-type  |  application/json | relatd to the json body |


## Response

```json
{
    "code": 200000,
    "message": "success",
    "content": {
        "expiresIn": "3600s",
        "accessToken": "eyJhbGciOiJIU***",
        "tokenType": "bearer"
    }
}
```

**Response Fields Description**


| field | data-type | description |
|------------|--------------|-------------|
| code  | int | numeric value which indicates the success or failure of invocation. 200XYZ for success and any other value for failures  |
| message  | string | message related to code. On errors contains a description  |
| content.accessToken  | string | token to be attached to any api invocation  |
| content.expiresIn  | string | token expiration in seconds  |

**Response Headers Description**

| header key | header value | description |
|------------|--------------|-------------|
| x-horus-request-id  |  ***** | value received in request headers or a  random alphanumeric value if client don't send it|

**Response codes**

| code | description |
|------------|-------------|
| 400  | field is required.  |
| 401122  | clientId or clientScret are invalid.  |
